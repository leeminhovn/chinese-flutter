import 'package:flutter/cupertino.dart';

import '../../../components/molecules/inputs/input_custom_auth.dart';
import '../../../components/oragnisms/buttons/button.dart';
import '../../../components/oragnisms/wrap_popup_page.dart';

class SignupEmailMethod extends StatelessWidget {
  final Function handleShowToggle;
  SignupEmailMethod({required this.handleShowToggle, super.key});

  TextEditingController controllerDisplayName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WrapPopupPage(
      title: "SIGN UP",
      otherActionBack: handleShowToggle,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 30,
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
            const SizedBox(height: 40),
            InputCustomAuth(
              hintText: "Display name",
              isObscureText: false,
              onChanged: (String text) {},
            ),
            const SizedBox(
              height: 30,
            ),
            InputCustomAuth(
              hintText: "Enter your account email",
              isObscureText: false,
              onChanged: (String text) {},
            ),
            const SizedBox(
              height: 30,
            ),
            InputCustomAuth(
              hintText: "Enter your password",
              isObscureText: false,
              onChanged: (String text) {},
            ),
            const SizedBox(
              height: 30,
            ),
            Button("CREATE ACCOUNT", height: 68, funcClick: () {}),
          ],
        ),
      ),
    );
  }
}
