import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/pages/home/main_page.dart';
import 'package:qrcode_pay/pages/home/outlet.dart';
import 'package:qrcode_pay/pages/home/outlet/pilih_makan.dart';
import 'package:qrcode_pay/pages/home/top_up.dart';
import 'package:qrcode_pay/pages/home/topup/qr_top_up.dart';
import 'package:qrcode_pay/pages/home/wahana.dart';
import 'package:qrcode_pay/pages/home/wahana/jumlah_wahana.dart';
import 'package:qrcode_pay/pages/sign_in.dart';
import 'package:qrcode_pay/providers/auth_provider.dart';
import 'package:qrcode_pay/providers/outlet_provider.dart';

void main() => runApp(const QrPay());

class QrPay extends StatelessWidget {
  const QrPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => OutletProvider()),
      ],
      child: MaterialApp(
        routes: {
          // '/': (context) => const Test(),
          '/': (context) => const SignIn(),
          '/main_page': (context) => const MainPage(),
          '/top_up': (context) => const TopUp(),
          '/outlet': (context) => Outlet(
                outlet: OutletModel(),
              ),
          '/wahana': (context) => const Wahana(),
          '/qr_topup': (context) => const QrTopUp(),
          '/jumlah_wahana': (context) => const JumlahWahana(),
          '/pilih_makan': (context) => const PilihMakan(),
        },
      ),
    );
  }
}
