import 'package:flutter/material.dart';
import 'package:go_event_id/widget/auth/login/form.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
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
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hello !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveBreakpoints.of(context)
                                            .isTablet
                                        ? 50
                                        : 40,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Selamat Datang di GoEventID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveBreakpoints.of(context)
                                            .isTablet
                                        ? 30
                                        : 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.6,
                          decoration: const BoxDecoration(
                              color: Color(0xFFEBEFEE),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: const FormLogin(),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
