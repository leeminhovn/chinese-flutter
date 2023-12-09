import 'package:MochiChinese/config/router_name.dart';
import 'package:MochiChinese/src/components/molecules/inputs/input_custom_auth.dart';
import 'package:MochiChinese/src/components/oragnisms/buttons/button.dart';
import 'package:MochiChinese/src/components/oragnisms/wrap_popup_page.dart';
import 'package:MochiChinese/src/modules/profile/bloc/user_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupEmailMethod extends StatefulWidget {
  final Function handleShowToggle;

  const SignupEmailMethod({required this.handleShowToggle, super.key});

  @override
  State<SignupEmailMethod> createState() => _SignupEmailMethodState();
}

class _SignupEmailMethodState extends State<SignupEmailMethod> {
  FocusNode _focusNodeInputEmail = FocusNode();
  FocusNode _focusNodeInputPassword = FocusNode();

  String valueName = '';

  String valueEmail = "";

  String valuePassword = '';

  String errName = '';

  String errEmail = '';

  String errPassword = '';

  bool isEmailValid(String email) {
    // Sử dụng regex để kiểm tra định dạng email
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isActive() {
      return valueName != '' &&
          valueEmail != '' &&
          valuePassword != '' &&
          errName == "" &&
          errPassword == '' &&
          errEmail == '';
    }

    handleRegister() async {
      final String? err = await BlocProvider.of<UserCubit>(context)
          .signupByEmailAction(valueEmail, valuePassword, valueName);

      if (err == null) {
        context.go(ApplicationRouteName.learn,
            extra: {"popupShow": "popupLearnALessonAfterLogin"});
      } else {
        print(err);
        errEmail = err;
        setState(() {});
      }
    }

    return WrapPopupPage(
      title: "SIGN UP",
      otherActionBack: widget.handleShowToggle,
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
              onChanged: (String text) {
                valueName = text;
                if (text.length < 6) {
                  errName = "*Must have a minimum of 6 characters";
                } else {
                  errName = "";
                }
                setState(() {});
              },
              errMessage: errName,
              onSubmitted: (value) {
                // Khi người dùng nhấn Enter, chuyển focus sang ô input thứ hai

                FocusScope.of(context).requestFocus(_focusNodeInputEmail);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InputCustomAuth(
              focusNodeAuthInput: _focusNodeInputEmail,
              hintText: "Enter your account email",
              isObscureText: false,
              onChanged: (String text) {
                valueEmail = text;
                errEmail =
                    (!isEmailValid(text)) ? "*Incorrect format email" : "";
                setState(() {});
              },
              errMessage: errEmail,
              onSubmitted: (value) {
                // Khi người dùng nhấn Enter, chuyển focus sang ô input thứ hai

                FocusScope.of(context).requestFocus(_focusNodeInputPassword);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InputCustomAuth(
              focusNodeAuthInput: _focusNodeInputPassword,
              hintText: "Enter your password",
              isObscureText: false,
              onSubmitted: (value) => {
                if (isActive()) {handleRegister()}
              },
              onChanged: (String text) {
                valuePassword = text;
                if (text.length < 6) {
                  errPassword = "*Must have a minimum of 6 characters";
                } else {
                  errPassword = "";
                }
                setState(() {});
              },
              errMessage: errPassword,
            ),
            const SizedBox(
              height: 30,
            ),
            Button("CREATE ACCOUNT",
                color: isActive() ? "orange" : "silver",
                height: 68, funcClick: () {
              handleRegister();
            }),
          ],
        ),
      ),
    );
  }
}
