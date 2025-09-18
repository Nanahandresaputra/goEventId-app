import 'package:flutter/material.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/widget/auth/register/form.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/auth-bg.png'),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: const BoxDecoration(
                        color: Color(0xFFEBEFEE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.keyboard_arrow_left,
                                    size: ResponsiveBreakpoints.of(context)
                                            .isTablet
                                        ? 40
                                        : 30,
                                    color: const Color(0xFF235146)),
                                Text(
                                  'Kembali ke Login',
                                  style: TextStyle(
                                    color: const Color(0xFF235146),
                                    fontSize: ResponsiveBreakpoints.of(context)
                                            .isTablet
                                        ? 26
                                        : 18,
                                  ),
                                )
                              ],
                            )),
                        FormRegister()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
