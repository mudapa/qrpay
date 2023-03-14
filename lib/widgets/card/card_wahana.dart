import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/wahana_model.dart';
import 'package:qrcode_pay/providers/wahana_provider.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class CardWahana extends StatelessWidget {
  final WahanaModel wahana;
  const CardWahana(
    this.wahana, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WahanaProvider wahanaProvider = Provider.of<WahanaProvider>(context);
    wahanaId() async {
      bool success = await wahanaProvider.getWahanaId();
      print(success);
      if (success) {
        Navigator.pushNamed(context, '/detail_wahana');
      }
    }

    return GestureDetector(
      onTap: wahanaId,
      child: Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: bg7Color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/carousel.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wahana.name!,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        'Rp ${wahana.price}',
                        style: priceTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
