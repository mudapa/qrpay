import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/balance_cek_model.dart';
import 'package:qrcode_pay/providers/balance_cek_provider.dart';
import 'package:qrcode_pay/providers/outlet_provider.dart';
import 'package:qrcode_pay/widgets/card/card_content.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // User authProvider
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel user = authProvider.user;

    // CekBalance cekBalanceProvider
    BalanceCekProvider balanceCekProvider =
        Provider.of<BalanceCekProvider>(context);
    BalanceCekModel balanceCek = balanceCekProvider.balanceCek;

    // Outlet outletProvider
    OutletProvider outletProvider = Provider.of<OutletProvider>(context);
    outletIn() async {
      bool success = await outletProvider.getOutlets();
      print(success);
      if (success) {
        Navigator.pushNamed(context, '/outlet');
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/image_profile.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          header(),
          Container(
            margin: EdgeInsets.only(
              top: 64,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 64,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Saldo Anda : Rp. ${balanceCek.balance}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semibold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardContent(
                      text: 'Top Up',
                      gambar: 'assets/button_add.png',
                      onPressed: () {
                        Navigator.pushNamed(context, '/top_up');
                      },
                    ),
                    CardContent(
                      text: 'Outlet',
                      gambar: 'assets/store.png',
                      onPressed: outletIn,
                    ),
                    CardContent(
                      text: 'Wahana',
                      gambar: 'assets/carousel.png',
                      onPressed: () {
                        Navigator.pushNamed(context, '/wahana');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                CardContent(
                  text: 'Verify Top up',
                  gambar: 'assets/check.png',
                  onPressed: () {
                    Navigator.pushNamed(context, '/verify_topup');
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: content(),
    );
  }
}
