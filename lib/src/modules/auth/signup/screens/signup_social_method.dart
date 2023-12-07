import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/core/constant/assets_manager.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button_login_social.dart';
import 'package:MochiChinese/src/components/oragnisms/wrap_popup_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupSocialMethod extends StatelessWidget {
  final String backPage;
  final Function handleShowToggle;

  const SignupSocialMethod(
      {required this.handleShowToggle, required this.backPage, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenHeight = MediaQuery.of(context).size.height;
    _handleGoToLogin() {
      context.push(ApplicationRouteName.login);
    }

    _handleGoEmail() {
      handleShowToggle();
    }

    return WrapPopupPage(
      title: "SIGN UP",
      backPage: backPage,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 25,
          bottom: 25,
        ),
        child: Column(
          children: [
            const Text(
              "How do you want to create an account?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(AssetsManager.mochi.mochi_investigator),
            const SizedBox(
              height: 20,
            ),
            ButtonLoginSocial(
                pathIcon: AssetsManager.icons.icon_google_plus,
                text: "Continue with G+",
                textColor: const Color.fromRGBO(244, 67, 54, 1),
                funcClick: () => {}),
            const SizedBox(
              height: 20,
            ),
            ButtonLoginSocial(
                pathIcon: AssetsManager.icons.icon_apple,
                text: "Continue with Apple",
                textColor: Colors.black,
                funcClick: () => {}),
            const SizedBox(
              height: 20,
            ),
            const Text("or",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Button("Create account with email",
                height: 68, funcClick: _handleGoEmail),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Do you already have an account? ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                GestureDetector(
                  onTap: _handleGoToLogin,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xff3ec654),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        fontSize: 17),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
