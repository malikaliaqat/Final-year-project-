// // // // import 'package:flutter/material.dart';
// // // // import 'package:food_delivery/view/login/login_view.dart';
// // // // import 'package:food_delivery/view/login/sing_up_view.dart';

// // // // import '../../common/color_extension.dart';
// // // // import '../../common_widget/round_button.dart';

// // // // class WelcomeView extends StatefulWidget {
// // // //   const WelcomeView({super.key});

// // // //   @override
// // // //   State<WelcomeView> createState() => _WelcomeViewState();
// // // // }

// // // // class _WelcomeViewState extends State<WelcomeView> {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     var media = MediaQuery.of(context).size;

// // // //     return Scaffold(
// // // //       body: SingleChildScrollView(
// // // //         child: Column(
// // // //           children: [
// // // //             Stack(
// // // //               alignment: Alignment.bottomCenter,
// // // //               children: [
// // // //                 Image.asset(
// // // //                   "assets/img/welcome_top_shape.png",
// // // //                   width: media.width,
// // // //                 ),
// // // //                 Image.asset(
// // // //                   "assets/img/app_logo.png",
// // // //                   width: media.width * 0.55,
// // // //                   height: media.width * 0.55,
// // // //                   fit: BoxFit.contain,
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             SizedBox(
// // // //               height: media.width * 0.1,
// // // //             ),
// // // //             Text(
// // // //               "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
// // // //               textAlign: TextAlign.center,
// // // //               style: TextStyle(
// // // //                   color: TColor.secondaryText,
// // // //                   fontSize: 13,
// // // //                   fontWeight: FontWeight.w500),
// // // //             ),
// // // //             SizedBox(
// // // //               height: media.width * 0.1,
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 25),
// // // //               child: RoundButton(
// // // //                 title: "Login",
// // // //                 onPressed: () {
// // // //                   Navigator.push(
// // // //                     context,
// // // //                     MaterialPageRoute(
// // // //                       builder: (context) => const LoginView(),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //             const SizedBox(
// // // //               height: 20,
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 25),
// // // //               child: RoundButton(
// // // //                 title: "Create an Account",
// // // //                 type: RoundButtonType.textPrimary,
// // // //                 onPressed: () {
// // // //                    Navigator.push(
// // // //                     context,
// // // //                     MaterialPageRoute(
// // // //                       builder: (context) => const SignUpView(),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //             const SizedBox(
// // // //               height: 20,
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
import 'package:flutter/material.dart';
import 'package:food_delivery/view/login/login_view.dart';
import 'package:food_delivery/view/login/sing_up_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔝 TOP SECTION (perfect curve)
              Container(
                height: media.height * 0.36,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: TColor.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(media.width * 0.3),
                    bottomRight: Radius.circular(media.width * 0.3),
                  ),
                ),
                child: Stack(
                  children: [
                    _circle(140, top: 40, left: -40),
                    _circle(180, top: 60, right: -50),
                    _circle(30, top: 150, left: 70),
                    _circle(20, top: 180, right: 90),
                  ],
                ),
              ),

              // 🔥 BIG LOGO (perfect overlap)
              Transform.translate(
                offset: const Offset(0, -70),
                child: Container(
                  height: 250, // 🔥 BIG
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/img/logo_img.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 0),

              const Text(
                "FOOD DELIVERY",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  letterSpacing: 4,
                ),
              ),

              const SizedBox(height: 18),

              // 📝 DESCRIPTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // 🔘 LOGIN BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              // 🔘 SIGNUP BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "Create an Account",
                  type: RoundButtonType.textPrimary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // 🎯 background circles
  Widget _circle(double size, {double? top, double? left, double? right}) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
