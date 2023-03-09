import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class QrTopUp extends StatelessWidget {
  const QrTopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: const [
              Text('Scan Top Up'),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Top Up'),
        centerTitle: true,
      ),
      body: content(),
    );
  }
}
