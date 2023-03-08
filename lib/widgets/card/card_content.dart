import 'package:flutter/material.dart';
import 'package:qrcode_pay/widgets/theme.dart';

class CardContent extends StatelessWidget {
  final String text;
  final String gambar;
  final VoidCallback? onPressed;
  const CardContent({
    Key? key,
    required this.text,
    required this.gambar,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: blackColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Image(
            image: AssetImage(gambar),
            width: 32,
          ),
          const SizedBox(height: 12),
          Text(
            text,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
