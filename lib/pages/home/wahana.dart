import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/wahana_model.dart';
import 'package:qrcode_pay/providers/wahana_provider.dart';
import 'package:qrcode_pay/widgets/card/card_wahana.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class Wahana extends StatelessWidget {
  const Wahana({
    Key? key,
    required WahanaModel wahana,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WahanaProvider wahanaProvider = Provider.of<WahanaProvider>(context);
    Widget content() {
      return ListView(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        children: wahanaProvider.wahanas
            .map(
              (wahana) => CardWahana(wahana),
            )
            .toList(),
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
