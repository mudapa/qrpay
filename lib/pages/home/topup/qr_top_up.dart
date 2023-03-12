import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/top_up_model.dart';
import 'package:qrcode_pay/providers/top_up_provider.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class QrTopUp extends StatelessWidget {
  const QrTopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TopUpProvider topUpProvider = Provider.of<TopUpProvider>(context);
    TopUpModel topUp = topUpProvider.topUp;

    Widget content() {
      return Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              const Text('Scan Top Up'),
              const SizedBox(height: 20),
              Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "http://0.0.0.0:8000/${topUp.path}",
                    ),
                  ),
                ),
              ),
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
