import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  const CustomTextfield({
    Key? key,
    required this.text,
    required this.hintText,
    this.controller,
    required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              color: bg7Color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      obscureText: isPassword,
                      controller: controller,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText,
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
