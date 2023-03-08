import 'package:flutter/material.dart';
import 'package:qrcode_pay/pages/sign_in.dart';
import 'package:qrcode_pay/pages/test.dart';

void main() => runApp(const QrPay());

class QrPay extends StatelessWidget {
  const QrPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Test(),
        '/sign_in': (context) => const SignIn(),
      },
    );
  }
}
