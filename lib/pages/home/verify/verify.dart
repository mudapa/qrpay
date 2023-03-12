import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/providers/verify_topup_provider.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    // VerifyTopUpProvider
    VerifyTopupProvider verifyTopUpProvider =
        Provider.of<VerifyTopupProvider>(context);

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleBarcodeScannerPage(),
                  ),
                );
                if (res is String) {
                  setState(() {
                    result = res;
                  });
                  await verifyTopUpProvider.verifyTopup(
                    topupCode: result,
                  );
                }
              },
              child: const Text('Bayar'),
            ),
            const SizedBox(height: 32),
            Text('Barcode Result: $result'),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Top Up'),
        centerTitle: true,
      ),
      body: content(),
    );
  }
}
