import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/data_model.dart';
import 'package:qrcode_pay/providers/auth_provider.dart';
import 'package:qrcode_pay/widgets/card/card_content.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // User authProvider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
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
                    'Hallo, ${user.id} ${user.name} ${user.email} ${user.message} ${user.token}',
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
            child: Row(
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/outlet');
                  },
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
          )
        ],
      );
    }

    return Scaffold(
      body: content(),
    );
  }
}
