import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

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
            "Registrasi Akun",
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
                    label: 'Nama',
                  ),
                  InputField(
                    label: 'Email',
                    isEmail: true,
                  ),
                  InputField(
                    label: 'Kata Sandi',
                    isPassword: true,
                  ),
                  InputField(
                    label: 'Konfirmasi Kata Sandi',
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomElevatedBtn(onPressed: () {}, label: 'Daftar')
                ],
              )),
        ],
      ),
    );
  }
}
