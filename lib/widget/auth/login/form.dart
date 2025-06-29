import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
import 'package:go_event_id/helpers/email_validator.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/auth/forgot_password.dart';
import 'package:go_event_id/screen/auth/register.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();

    TextEditingController passwordController = TextEditingController();

    void loginSubmit(context, state) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print('state ---> $state');

      String? token = prefs.getString('token');

      if (token != null) {
        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ListAcara()));
      }

      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty) {
        if (state is LoginSuccess) {
          final jwt = JWT.decode(state.loginModel.token);

          await prefs.setString('token', state.loginModel.token);
          await prefs.setInt('userId', jwt.payload['id']);
          await prefs.setString('name', jwt.payload['name']);
          await prefs.setString('role', jwt.payload['role']);
          await prefs.setString('email', jwt.payload['email']);

          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ListAcara()));
        }
        if (state is LoginError) {
          print('state login error ${state.apiExeception!.statusCode}');
          if (state.apiExeception!.statusCode != 401) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.apiExeception!.message!),
                    ));
          }
        }
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          loginSubmit(context, state);
        });
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
                        required: true,
                        label: 'Email',
                        isEmail: true,
                        errorValidation: state is LoginError,
                        controller: emailController,
                      ),
                      InputField(
                        required: true,
                        label: 'Kata Sandi',
                        isPassword: true,
                        controller: passwordController,
                        errorValidation: state is LoginError,
                        errorValidationText: 'Email atau Password salah!',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedBtn(
                          isLoading: state is LoginLoading,
                          onPressed: () async {
                            Map<String, String> body = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };

                            if ((emailController.text.isNotEmpty ||
                                    passwordController.text.isNotEmpty) &&
                                !EmailValidator(value: emailController.text)
                                    .isValid()) {
                              context
                                  .read<AuthBloc>()
                                  .add(GetLoginEvent(loginBody: body));
                              await Future.delayed(const Duration(seconds: 1));
                            }

                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              return;
                            }
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
      },
    );
  }
}
