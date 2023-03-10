import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/providers/outlet_provider.dart';
import 'package:qrcode_pay/widgets/card/card_outlet.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class Outlet extends StatefulWidget {
  const Outlet({
    Key? key,
    required OutletModel outlet,
  }) : super(key: key);

  @override
  State<Outlet> createState() => _OutletState();
}

class _OutletState extends State<Outlet> {
  @override
  Widget build(BuildContext context) {
    OutletProvider outletProvider = Provider.of<OutletProvider>(context);
    Widget content() {
      return Container(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: ListView(
          children: outletProvider.outlets
              .map(
                (outlet) => CardOutlet(outlet),
              )
              .toList(),
        ),
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
