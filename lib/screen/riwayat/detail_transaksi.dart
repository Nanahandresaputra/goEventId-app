import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/screen/riwayat/riwayat_transaksi.dart';
import 'package:go_event_id/widget/riwayat/detail_transaksi/e_tiket.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DetailTransaksi extends StatelessWidget {
  final dynamic data;
  const DetailTransaksi({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF235347),
          centerTitle: true,
          title: Text(
            'Detail Transaksi',
            style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveBreakpoints.of(context).isTablet ? 28 : 18,
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
              icon: Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
                size: ResponsiveBreakpoints.of(context).isTablet ? 36 : 25,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              ETiket(
                data: data,
              )
            ],
          ),
        ),
      ),
    );
  }
}
