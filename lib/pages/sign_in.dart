import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrcode_pay/models/data_model.dart';
import 'package:qrcode_pay/providers/auth_provider.dart';
import 'package:qrcode_pay/providers/balance_cek_provider.dart';
import 'package:qrcode_pay/widgets/button/custom_button.dart';
import 'package:qrcode_pay/widgets/textfield/custom_textfield.dart';
import 'package:qrcode_pay/widgets/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // CekBalance cekBalanceProvider
    BalanceCekProvider balanceCekProvider =
        Provider.of<BalanceCekProvider>(context);

    // Auth Provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', authProvider.user.token);
        await balanceCekProvider.cekBalance();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            content: const Text(
              'Login Success',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamed(context, '/main_page');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            content: const Text(
              'Login Fail!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            CustomTextfield(
              text: 'Email',
              hintText: 'Your Email Address',
              isPassword: false,
              controller: emailController,
            ),
            CustomTextfield(
              text: 'Password',
              hintText: 'Your Password',
              isPassword: true,
              controller: passwordController,
            ),
            CustomButton(
              text: 'Login',
              onPressed: handleSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
