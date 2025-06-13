import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final Function()? onTap;
  final int? defaultCurrent;
  const Footer({super.key, this.onTap, this.defaultCurrent});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.defaultCurrent ?? _currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      backgroundColor: const Color(0xFF58BDBD),
      elevation: 8,
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
        if (value == 1) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const FormProduct() ));
        } else if (value == 2) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (constext) => const Account()));
        } else {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (constext) => const ListProduct()));
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_rounded),
          label: 'Tambah',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Akun',
        ),
      ],
    );
  }
}
