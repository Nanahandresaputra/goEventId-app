import 'package:flutter/material.dart';

class LoadinFullScreen extends StatelessWidget {
  const LoadinFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Color.fromARGB(94, 0, 0, 0),
      child: const Center(
        child: SizedBox(
            width: 150,
            height: 150,
            child: Image(image: AssetImage('assets/img/loading-animate.gif'))),
      ),
    );
  }
}
