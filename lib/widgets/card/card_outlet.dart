import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/outlet_model.dart';
import 'package:qrcode_pay/providers/outlet_provider.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class CardOutlet extends StatelessWidget {
  final OutletModel outlet;
  const CardOutlet(this.outlet, {super.key});

  @override
  Widget build(BuildContext context) {
    OutletProvider outletProvider = Provider.of<OutletProvider>(context);
    productGet() async {
      bool success = await outletProvider.getProducts();
      print(success);
      if (success) {
        Navigator.pushNamed(context, '/product');
      }
    }

    return GestureDetector(
      onTap: productGet,
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
                        outlet.name!,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      ),
                      Text(
                        outlet.address!,
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
