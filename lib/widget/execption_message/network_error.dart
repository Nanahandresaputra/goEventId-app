import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';

class NetworkError extends StatelessWidget {
  final Function()? onReload;
  const NetworkError({this.onReload, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          const Image(
            image: AssetImage(
              'assets/img/network-error.png',
            ),
            height: 200,
          ),
          const Text('Tidak ada koneksi internet!',
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'Data seluler dinonaktifkan. Aktifkan data seluler atau sambungkan ponsel Anda ke Wi-Fi untuk menggunakan aplikasi.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45)),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: 300,
            child: CustomElevatedBtn(
              onPressed: onReload,
              label: 'Reload',
            ),
          )
        ]));
  }
}
