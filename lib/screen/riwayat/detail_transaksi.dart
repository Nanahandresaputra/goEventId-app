import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/screen/riwayat/riwayat_transaksi.dart';
import 'package:go_event_id/widget/riwayat/detail_transaksi/acara_info.dart';
import 'package:go_event_id/widget/riwayat/detail_transaksi/e_tiket.dart';

class DetailTransaksi extends StatelessWidget {
  const DetailTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xFF235347),
            centerTitle: true,
            title: const Text(
              'Detail Transaksi',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            elevation: 8,
            leading: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RiwayatTransaksi()));
                },
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[ETiket()],
            ),
          ),
        ),
      ),
    );
  }
}
