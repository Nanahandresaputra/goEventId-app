import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/riwayat/riwayat_transaksi/card_acara_pemesanan.dart';

class RiwayatTransaksi extends StatelessWidget {
  const RiwayatTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF235347),
        appBar: AppBar(
            backgroundColor: const Color(0xFF235347),
            centerTitle: true,
            title: const Text(
              'Riwayat Pemesanan',
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
                          builder: (context) => const ListAcara()));
                },
                icon: const Icon(
                  CupertinoIcons.arrow_left,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            )),
        bottomNavigationBar: const Footer(
          defaultCurrent: 0,
        ),
        body: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DetailTransaksi())),
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const CardAcaraPemesanan()),
          ),
        ),
      ),
    );
  }
}
