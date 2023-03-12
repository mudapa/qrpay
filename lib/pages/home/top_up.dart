import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/providers/top_up_provider.dart';
import 'package:qrcode_pay/widgets/card/card_top_up.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class TopUp extends StatelessWidget {
  const TopUp({super.key});

  @override
  Widget build(BuildContext context) {
    // TopUp topUpProvider
    TopUpProvider topUpProvider = Provider.of<TopUpProvider>(context);
    topUpIn() async {
      if (await topUpProvider.topupBalance(
        userId: "1",
        topupAmount: "10000",
      )) {
        Navigator.pushNamed(context, '/qr_topup');
      }
    }

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
                  text: '10000',
                  onTap: topUpIn,
                ),
                const CardTopUp(text: '15000'),
                const CardTopUp(text: '20000'),
                const CardTopUp(text: '25000'),
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
