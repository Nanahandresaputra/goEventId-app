import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/auth/auth_bloc.dart';
import 'package:go_event_id/helpers/email_validator.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/atoms/input_field.dart';
import 'package:go_event_id/widget/utils/panara_dialog.dart';
import 'package:go_event_id/widget/utils/show_toast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _formKeyRegister = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool _callbackRegistered = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void registerSubmit(context, state) async {
      if (emailController.text.isNotEmpty ||
          passwordController.text.isNotEmpty ||
          nameController.text.isNotEmpty) {
        if (state is RegisterSuccess) {
          showToast(context, 'Success', 'Pendaftaran akun telah berhasil!',
              ToastificationType.success);

          setState(() {
            _callbackRegistered = true;
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Login();
          }));
        }
        if (state is RegisterError) {
          showModernDialog(
              context,
              "Terjadi Kesalahan!",
              state.apiExeception!.message!,
              "Mengerti",
              PanaraDialogType.error);
          setState(() {
            _callbackRegistered = true;
          });
        }
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (!_callbackRegistered) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            registerSubmit(context, state);
          });
        }
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
                "Registrasi Akun",
                style: TextStyle(
                    color: const Color(0xFF235146),
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 36 : 26,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKeyRegister,
                  child: Column(
                    children: <Widget>[
                      InputField(
                        label: 'Nama',
                        required: true,
                        controller: nameController,
                      ),
                      InputField(
                        label: 'Email',
                        isEmail: true,
                        required: true,
                        controller: emailController,
                      ),
                      InputField(
                        label: 'Kata Sandi',
                        isPassword: true,
                        required: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomElevatedBtn(
                          width: ResponsiveBreakpoints.of(context).isTablet
                              ? MediaQuery.of(context).size.width * 0.9
                              : 400,
                          isLoading: state is RegisterLoading,
                          onPressed: () async {
                            setState(() {
                              _callbackRegistered = false;
                            });
                            Map<String, String> body = {
                              'nama': nameController.text,
                              'email': emailController.text,
                              'password': passwordController.text,
                            };

                            if ((emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty &&
                                    nameController.text.isNotEmpty) &&
                                !EmailValidator(value: emailController.text)
                                    .isValid()) {
                              context
                                  .read<AuthBloc>()
                                  .add(GetRegisterEvent(registerBody: body));
                              await Future.delayed(const Duration(seconds: 1));
                            }

                            if (_formKeyRegister.currentState != null &&
                                _formKeyRegister.currentState!.validate()) {
                              return;
                            }
                          },
                          label: 'Daftar')
                    ],
                  )),
            ],
          ),
        );
      },
    );
  }
}
