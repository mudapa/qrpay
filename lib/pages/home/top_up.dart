import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/card/card_top_up.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class TopUp extends StatelessWidget {
  const TopUp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        children: [
          Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Isi Saldo Berapa ?'),
                CardTopUp(
                  text: '5000',
                  onTap: () {
                    Navigator.pushNamed(context, '/qr_topup');
                  },
                ),
                const CardTopUp(text: '10000'),
                const CardTopUp(text: '15000'),
                const CardTopUp(text: '20000'),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
        centerTitle: true,
      ),
      body: content(),
    );
  }
}
