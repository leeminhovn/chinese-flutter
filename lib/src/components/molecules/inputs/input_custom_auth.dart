import 'package:flutter/material.dart';

class InputCustomAuth extends StatefulWidget {
  final String hintText;
  final bool isObscureText;
  final String errMessage;
  final Function(String text) onChanged;
  const InputCustomAuth(
      {this.hintText = "",
      required this.onChanged,
      this.isObscureText = false,
      this.errMessage = "",
      super.key});

  @override
  State<StatefulWidget> createState() =>
      _InputCustomAuth(isObscureText: isObscureText);
}

class _InputCustomAuth extends State<InputCustomAuth> {
  bool isObscureText = false;
  _InputCustomAuth({required this.isObscureText});
  _toogleShowPass(e) {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          obscureText: isObscureText,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0, // Khoảng đ
                  // ệm ngang
                  vertical: 20),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: widget.errMessage.isNotEmpty
                    ? const Color(0xffeb5757)
                    : Colors.grey.withOpacity(0.5), // Màu chữ
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5,
                    color: widget.errMessage.isNotEmpty
                        ? const Color(0xffeb5757)
                        : const Color(
                            0xfffb993b)), // Màu border khi TextField được focus
                borderRadius: BorderRadius.circular(
                    15.0), // Radius của border khi TextField được focus
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 1.5,
                    color: Color.fromRGBO(189, 189, 189,
                        0.5)), // Màu border khi TextField không được focus
                borderRadius: BorderRadius.circular(
                    15.0), // Radius của border khi TextField không được focus
              ),
              filled: true, // Bật chế độ filled để có thể thiết lập màu nền
              fillColor: Colors.transparent,
              suffixIcon: (widget.isObscureText == true)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTapDown: _toogleShowPass,
                        child: Text(
                          isObscureText ? "Show" : "Hide",
                          style: const TextStyle(
                            shadows: [
                              Shadow(
                                  color: Color(0xff53de69),
                                  offset: Offset(0, -1))
                            ],
                            fontWeight: FontWeight.w700,
                            color: Colors.transparent,
                            height: 2.3,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff53de69),
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()),
          onChanged: widget.onChanged,
        ),
        if (widget.errMessage.length != 0)
          Positioned(
              bottom: -23,
              child: Text(
                widget.errMessage,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffeb5757)),
              ))
      ],
    );
  }
}
