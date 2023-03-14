import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/providers/wahana_provider.dart';
import 'package:qrcode_pay/widgets/theme.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class DetailWahana extends StatefulWidget {
  const DetailWahana({Key? key}) : super(key: key);

  @override
  State<DetailWahana> createState() => _DetailWahanaState();
}

class _DetailWahanaState extends State<DetailWahana> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    WahanaProvider wahanaProvider = Provider.of<WahanaProvider>(context);
    payWahana() async {
      if (await wahanaProvider.payPlayground(
        playgroundId: "1",
        userId: "1",
      )) {}
    }

    Widget content() {
      return Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              Image.asset(
                'assets/carousel.png',
                width: 128,
              ),
              // const SizedBox(height: 24),
              // const Text('Jumlah Orang'),
              // const SizedBox(height: 24),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     GestureDetector(
              //       onTap: () {},
              //       child: Image.asset(
              //         'assets/button_add.png',
              //         width: 34,
              //       ),
              //     ),
              //     const SizedBox(width: 64),
              //     Text(
              //       '0',
              //       style: primaryTextStyle.copyWith(
              //         fontSize: 34,
              //         fontWeight: medium,
              //       ),
              //     ),
              //     const SizedBox(width: 64),
              //     GestureDetector(
              //       onTap: () {},
              //       child: Image.asset(
              //         'assets/button_min.png',
              //         width: 34,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 50),
              // Text(
              //   'Rp 0',
              //   style: primaryTextStyle.copyWith(
              //     fontSize: 34,
              //     fontWeight: medium,
              //   ),
              // ),
              const SizedBox(height: 50),
              Column(
                children: [
                  ElevatedButton(
                    // onPressed: () async {
                    //   var res = await Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           const SimpleBarcodeScannerPage(),
                    //     ),
                    //   );
                    //   setState(() {
                    //     if (res is String) {
                    //       result = res;
                    //     }
                    //   });
                    // },
                    onPressed: payWahana,
                    child: const Text('Bayar'),
                  ),
                  // const SizedBox(height: 32),
                  // Text('Barcode Result: $result'),
                ],
              ),
            ],
          ),
        ),
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
