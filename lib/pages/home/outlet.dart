import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/card/card_outlet.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class Outlet extends StatelessWidget {
  const Outlet({Key? key}) : super(key: key);

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
          CardOutlet(
            name: 'Outlet A',
            onTap: () {
              Navigator.pushNamed(context, '/pilih_makan');
            },
          ),
          const CardOutlet(name: 'Outlet B'),
          const CardOutlet(name: 'Outlet C'),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Outlet'),
        centerTitle: true,
      ),
      body: content(),
    );
  }
}
