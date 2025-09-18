import 'package:flutter/material.dart';
import 'package:go_event_id/helpers/email_validator.dart';
import 'package:responsive_framework/responsive_framework.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool? isEmail;
  final bool? isPassword;
  // final bool? obscureText;
  final bool? required;
  final double? width;
  final double? height;
  final bool? errorValidation;
  final String? errorValidationText;
  final TextInputType? keyboardType;
  final int? minLines;
  final Icon? prefixIcon;

  late final String? _textInput = controller?.text;

  Future<bool> requiredValidator() async {
    if (_textInput == null || _textInput.isEmpty) {
      return true;
    }
    return false;
  }

  InputField(
      {super.key,
      this.controller,
      this.label,
      this.isEmail,
      // this.obscureText,
      this.required,
      this.width,
      this.height,
      this.errorValidation,
      this.errorValidationText,
      this.keyboardType,
      this.minLines,
      this.isPassword,
      this.prefixIcon});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool pwdVisibility = false;

  @override
  Widget build(BuildContext context) {
    bool emailValidator(dynamic value) {
      EmailValidator emailValidator = EmailValidator(value: value);
      return emailValidator.isValid();
    }

    Color labelColor = const Color(0xFF58BDBD);

    return Container(
      width: widget.width,
      height: widget.height,
      margin: const EdgeInsets.only(bottom: 17),
      child: TextFormField(
        style: TextStyle(
            fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 14),
        controller: widget.controller,
        obscureText: widget.isPassword ?? false ? !pwdVisibility : false,
        keyboardType: widget.keyboardType,
        minLines: widget.minLines,
        maxLines: pwdVisibility != true && widget.minLines != null
            ? widget.minLines
            : 1,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword ?? false
                ? InkWell(
                    onTap: () => {
                      setState(() {
                        pwdVisibility = !pwdVisibility;
                      })
                    },
                    child: Icon(
                      pwdVisibility ? Icons.visibility : Icons.visibility_off,
                      size:
                          ResponsiveBreakpoints.of(context).isTablet ? 25 : 18,
                    ),
                  )
                : null,
            labelText: widget.label,
            hintText: 'Masukan ${widget.label}',
            hintStyle: TextStyle(
                fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 14),
            labelStyle: TextStyle(
              fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 14,
            ),
            errorStyle: TextStyle(
                color: Colors.red,
                fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 14),
            floatingLabelStyle: WidgetStateTextStyle.resolveWith((state) {
              if (state.contains(WidgetState.focused)) {
                return TextStyle(
                    color: labelColor,
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 20 : 14);
              } else {
                return TextStyle(
                    color: Colors.black54,
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 20 : 14);
              }
            }),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black54),
                borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF58BDBD)),
                borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8))),
        validator: (value) {
          if (widget.required! && (value == null || value.isEmpty)) {
            setState(() {
              labelColor = Colors.red;
            });
            return '${widget.label} harus diisi!';
          } else if ((widget.isEmail ?? false)) {
            if (emailValidator(value)) {
              setState(() {
                labelColor = Colors.red;
              });

              return 'Email tidak valid!';
            }
            if (widget.errorValidation ?? false) {
              setState(() {
                labelColor = Colors.red;
              });
              return '';
            }
          } else if (widget.errorValidation ?? false) {
            setState(() {
              labelColor = Colors.red;
            });
            return widget.errorValidationText != null
                ? '${widget.errorValidationText}'
                : '';
          }

          setState(() {
            labelColor = const Color(0xFF58BDBD);
          });
          return null;
        },
      ),
    );
  }
}
