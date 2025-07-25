import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final formKeyForgotPw = GlobalKey<FormState>();

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
            "Lupa Kata Sandi",
            style: TextStyle(
                color: Color(0xFF235146),
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: formKeyForgotPw,
              child: Column(
                children: <Widget>[
                  InputField(
                    label: 'Email',
                    isEmail: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedBtn(onPressed: () {}, label: 'Kirim')
                ],
              )),
        ],
      ),
    );
  }
}
