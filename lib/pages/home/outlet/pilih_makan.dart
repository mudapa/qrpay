import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/card/card_makan.dart';
import 'package:qrcode_pay/widgets/theme.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class PilihMakan extends StatefulWidget {
  const PilihMakan({Key? key}) : super(key: key);

  @override
  State<PilihMakan> createState() => _PilihMakanState();
}

class _PilihMakanState extends State<PilihMakan> {
  @override
  Widget build(BuildContext context) {
    String result = '';
    Widget content() {
      return ListView(
        padding: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        children: const [
          CardMakan(
            name: 'Makanan A',
          ),
          CardMakan(
            name: 'Makanan B',
          ),
          CardMakan(
            name: 'Makanan C',
          ),
        ],
      );
    }

    Widget customButton() {
      return SizedBox(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$287,96',
                    style: priceTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: bg2Color,
            ),
            const SizedBox(height: 20),
            Container(
              height: 64,
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage(),
                          ));
                      setState(() {
                        if (res is String) {
                          result = res;
                        }
                      });
                    },
                    child: const Text('Open Scanner'),
                  ),
                  Text('Barcode Result: $result'),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Outlet A'),
        centerTitle: true,
      ),
      body: content(),
      bottomNavigationBar: customButton(),
    );
  }
}
