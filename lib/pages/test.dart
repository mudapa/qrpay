import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/button/custom_button.dart';
import 'package:qrcode_pay/widgets/card/card_content.dart';
import 'package:qrcode_pay/widgets/card/card_outlet.dart';
import 'package:qrcode_pay/widgets/card/card_wahana.dart';
import 'package:qrcode_pay/widgets/textfield/custom_textfield.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextfield(
                text: 'Username',
                hintText: 'Your Username',
                isPassword: false,
              ),
              const CustomTextfield(
                text: 'Password',
                hintText: 'Your Password',
                isPassword: true,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CardContent(
                    text: 'Top Up',
                    gambar: 'assets/button_add.png',
                    onPressed: () {},
                  ),
                  CardContent(
                    text: 'Outlet',
                    gambar: 'assets/store.png',
                    onPressed: () {},
                  ),
                  CardContent(
                    text: 'Wahana',
                    gambar: 'assets/carousel.png',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CardOutlet(name: 'Outlet A'),
              const CardWahana(name: 'Carousel A'),
              CustomButton(
                text: 'Continue Page',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_in');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
