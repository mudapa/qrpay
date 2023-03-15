import 'package:flutter/material.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class CardProduct extends StatelessWidget {
  final AllProductModel product;
  final GestureTapCallback? onTap;
  const CardProduct(
    this.product, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
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
                        'assets/store.png',
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
                        product.name,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        'Rp. ${product.price.toString()}',
                        style: blackTextStyle,
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
