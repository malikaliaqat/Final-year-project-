// import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/login/new_password_view.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
// import 'package:flutter/material.dart';
import '../../common/globs.dart';
import '../../common/service_call.dart';

class OTPView extends StatefulWidget {
  final String email;
  const OTPView({super.key, required this.email});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),

              Text(
                "We have sent an OTP to your email",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                "Please check your email ${widget.email}\ncontinue to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 60),

              // ✅ NEW OTP INPUT (PINPUT)
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  code = value;
                  btnSubmit();
                },
                onChanged: (value) {
                  code = value;
                },
              ),

              const SizedBox(height: 30),

              RoundButton(
                title: "Next",
                onPressed: () {
                  btnSubmit();
                },
              ),

              TextButton(
                onPressed: () {
                  serviceCallForgotRequest({"email": widget.email});
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't Received? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //TODO: Action
  void btnSubmit() {
    if (code.length != 6) {
      mdShowAlert(Globs.appName, MSG.enterCode, () {});
      return;
    }

    endEditing();

    serviceCallForgotVerify({
      "email": widget.email,
      "reset_code": code,
    });
  }

  //TODO: ServiceCall
  void serviceCallForgotVerify(Map<String, dynamic> parameter) {
    Globs.showHUD();

    ServiceCall.post(
      parameter,
      SVKey.svForgotPasswordVerify,
      withSuccess: (responseObj) async {
        Globs.hideHUD();
        if (responseObj[KKey.status] == "1") {
          var payloadObj = responseObj[KKey.payload] as Map? ?? {};
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPasswordView(nObj: payloadObj),
            ),
          );
        } else {
          mdShowAlert(
            Globs.appName,
            responseObj[KKey.message] as String? ?? MSG.fail,
            () {},
          );
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        mdShowAlert(Globs.appName, err.toString(), () {});
      },
    );
  }

  void serviceCallForgotRequest(Map<String, dynamic> parameter) {
    Globs.showHUD();

    ServiceCall.post(
      parameter,
      SVKey.svForgotPasswordRequest,
      withSuccess: (responseObj) async {
        Globs.hideHUD();
        if (responseObj[KKey.status] == "1") {
          mdShowAlert(Globs.appName, "reset code successfully", () {});
        } else {
          mdShowAlert(
            Globs.appName,
            responseObj[KKey.message] as String? ?? MSG.fail,
            () {},
          );
        }
      },
      failure: (err) async {
        Globs.hideHUD();
        mdShowAlert(Globs.appName, err.toString(), () {});
      },
    );
  }
}
