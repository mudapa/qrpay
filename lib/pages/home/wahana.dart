import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/card/card_wahana.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class Wahana extends StatelessWidget {
  const Wahana({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        children: [
          CardWahana(
            name: 'Wahana A',
            onTap: () {
              Navigator.pushNamed(context, '/jumlah_wahana');
            },
          ),
          const CardWahana(name: 'Wahana B'),
          const CardWahana(name: 'Wahana C'),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wahana'),
        centerTitle: true,
      ),
      body: content(),
    );
  }
}
