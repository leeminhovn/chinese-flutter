import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/src/components/molecules/inputs/input_custom_auth.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button_login_social.dart';
import 'package:MochiChinese/src/components/oragnisms/wrap_popup_page.dart';
import 'package:MochiChinese/src/constant/assets_manager.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/molecules/bottom_sheet/modal_bottom_sheet.dart';

class Login extends StatefulWidget {
  final String backPage;
  const Login({this.backPage = "", super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isEmailValid(String email) {
    // Sử dụng regex để kiểm tra định dạng email
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    // Kiểm tra xem mật khẩu có ít nhất 6 ký tự hay không
    return password.length >= 6;
  }

  String errEmail = "";
  String errPassword = "";
  String valueEmail = "";
  String valePassword = "";

  bool _handleCheckActive(errEmail, errPassword, valueEmail, valePassword) {
    return errEmail == "" &&
        errPassword == "" &&
        valueEmail != "" &&
        valePassword != "";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final screenHeight = MediaQuery.of(context).size.height;
    _handleGoToSignUp() {
      context.push(ApplicationRouteName.signup);
    }

    _handleLogin() async {
      final Map<String, dynamic>? error = await context
          .read<UserCubit>()
          .loginByEmailAction(valueEmail, valePassword);
      if (error == null) {
        context.go(ApplicationRouteName.learn,
            extra: {"popupShow": "popupLearnALessonAfterLogin"});
      } else {
        setState(() {
          errEmail = error["email"];
          errPassword = error["password"];
        });
      }
    }

    return WrapPopupPage(
        title: "LOG IN",
        backPage: widget.backPage,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ButtonLoginSocial(
                funcClick: () => {},
                pathIcon: AssetsManager.icons.icon_google_plus,
                text: "Continue with G+",
                textColor: const Color.fromRGBO(244, 67, 54, 1),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("or",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              InputCustomAuth(
                hintText: "Enter your account email",
                isObscureText: false,
                errMessage: errEmail,
                onChanged: (value) {
                  if (!isEmailValid(value)) {
                    errEmail = "* Incorrect email format";
                  } else {
                    errEmail = "";
                  }
                  valueEmail = value;

                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              InputCustomAuth(
                hintText: "Enter your password",
                isObscureText: true,
                errMessage: errPassword,
                onChanged: (value) {
                  if (!isPasswordValid(value)) {
                    errPassword = "* Password minimum 6 characters";
                  } else {
                    errPassword = "";
                  }
                  valePassword = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Button("LOG IN",
                  height: 68,
                  color: _handleCheckActive(
                          errEmail, errPassword, valueEmail, valePassword)
                      ? "orange"
                      : "silver",
                  funcClick: _handleLogin),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTapDown: (e) {
                  ModalBottomSheet.showBottomSheet(
                    context: context,
                    imageTopPath: AssetsManager.mochi.mochi_meo,
                    title:
                        "Please inbox Mochi for assistance in changing your password",
                    children: [
                      Button(
                        "INBOX MOCHI",
                        height: 60,
                        width: 200,
                        funcClick: () {},
                      )
                    ],
                  );
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: Color(0xfffb993b)),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "No account? ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: _handleGoToSignUp,
                    child: const Text(
                      "Create a new account ",
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
        ));
  }
}
