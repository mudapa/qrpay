import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/button/custom_button.dart';
import 'package:qrcode_pay/widgets/textfield/custom_textfield.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            CustomTextfield(
              text: 'Email',
              hintText: 'Your Email Address',
              isPassword: false,
            ),
            CustomTextfield(
              text: 'Password',
              hintText: 'Your Password',
              isPassword: true,
            ),
            CustomButton(
              text: 'Login',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
