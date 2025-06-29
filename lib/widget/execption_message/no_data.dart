import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(children: <Widget>[
      Image(
        image: AssetImage(
          'assets/img/no-result.png',
        ),
        height: 250,
      ),
      Text('Data Tidak Ditemukan',
          style: TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 20))
    ]));
  }
}
