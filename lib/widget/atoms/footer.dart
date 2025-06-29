import 'package:flutter/material.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/profile/menu_profile.dart';
import 'package:go_event_id/screen/riwayat/riwayat_transaksi.dart';

class Footer extends StatefulWidget {
  final Function()? onTap;
  final int? defaultCurrent;
  const Footer({super.key, this.onTap, this.defaultCurrent});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: BottomNavigationBar(
        iconSize: 30,
        selectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        currentIndex: widget.defaultCurrent ?? _currentIndex,
        selectedItemColor: const Color(0xFF235347),
        unselectedItemColor: Colors.black26,
        backgroundColor: Colors.white,
        elevation: 10,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          if (value == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RiwayatTransaksi()));
          } else if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (constext) => const ListAcara()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (constext) => const MenuProfile()));
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
