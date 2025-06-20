import 'package:flutter/material.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/auth/forgot_password.dart';
import 'package:go_event_id/screen/auth/register.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // const SizedBox(
          //   height: 20,
          // ),
          const Text(
            "Login",
            style: TextStyle(
                color: Color(0xFF235146),
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  InputField(
                    label: 'Email',
                    isEmail: true,
                  ),
                  InputField(
                    label: 'Kata Sandi',
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedBtn(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListAcara()));
                      },
                      label: 'Login')
                ],
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPassword()));
              },
              child: const Text(
                'Lupa kata sandi',
                style: TextStyle(color: Color(0xFF235146)),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Tidak punya akun?'),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: const Text(
                      'Daftar',
                      style: TextStyle(
                          color: Color(0xFF235146),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
