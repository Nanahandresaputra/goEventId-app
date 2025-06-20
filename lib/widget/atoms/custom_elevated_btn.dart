import 'package:flutter/material.dart';

class CustomElevatedBtn extends StatelessWidget {
  final Function()? onPressed;
  final String? label;
  final bool? isLoading;
  final Color? color;
  final double? width;
  final Icon? icon;

  const CustomElevatedBtn(
      {super.key,
      required this.onPressed,
      this.label,
      this.icon,
      this.isLoading,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 400,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color ?? const Color(0xFF214F44),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: isLoading == true ? null : onPressed,
          child: isLoading == true
              ? const SizedBox(
                  height: 14,
                  width: 14,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : label != null
                  ? Text(
                      '$label',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, height: 3),
                    )
                  : icon),
    );
  }
}
