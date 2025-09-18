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
import 'package:go_event_id/widget/utils/panara_dialog.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void loginSubmit(context, state) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

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
          if (state.apiExeception!.statusCode != 401) {
            showModernDialog(
                context,
                "Terjadi Kesalahan!",
                state.apiExeception!.message!,
                "Mengerti",
                PanaraDialogType.error);
          }
        }
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
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
              Text(
                "Login",
                style: TextStyle(
                    color: const Color(0xFF235146),
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 36 : 26,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ResponsiveBreakpoints.of(context).isTablet ? 40 : 30,
              ),
              Form(
                  key: _formKey,
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
                      SizedBox(
                        height: ResponsiveBreakpoints.of(context).isTablet
                            ? 30
                            : 20,
                      ),
                      CustomElevatedBtn(
                          width: ResponsiveBreakpoints.of(context).isTablet
                              ? MediaQuery.of(context).size.width * 0.9
                              : 400,
                          isLoading: state is LoginLoading,
                          onPressed: () async {
                            Map<String, String> body = {
                              'email': emailController.text,
                              'password': passwordController.text,
                            };

                            if ((emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) &&
                                !EmailValidator(value: emailController.text)
                                    .isValid()) {
                              context
                                  .read<AuthBloc>()
                                  .add(GetLoginEvent(loginBody: body));
                              await Future.delayed(const Duration(seconds: 1));
                            }

                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              return;
                            }
                          },
                          label: 'Login')
                    ],
                  )),
              SizedBox(
                height: ResponsiveBreakpoints.of(context).isTablet ? 10 : 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    'Lupa kata sandi',
                    style: TextStyle(
                        color: const Color(0xFF235146),
                        fontSize: ResponsiveBreakpoints.of(context).isTablet
                            ? 20
                            : 14),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveBreakpoints.of(context).isTablet ? 65 : 50,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Tidak punya akun?',
                      style: TextStyle(
                          fontSize: ResponsiveBreakpoints.of(context).isTablet
                              ? 20
                              : 14),
                    ),
                    // const SizedBox(
                    //   width: 2,
                    // ),

                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                              color: const Color(0xFF235146),
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 14),
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
