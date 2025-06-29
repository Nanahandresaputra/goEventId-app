import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ETiket extends StatelessWidget {
  const ETiket({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black38, blurRadius: 4, offset: Offset(0, 0))
          ]),
      child: Column(
        children: <Widget>[
          const ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/event-banner-dummy.png'),
                height: 85,
                width: double.maxFinite,
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Kode Booking'),
                    Text('KXXXXZZZ9090AAA'),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 20),
                  width: 180,
                  height: 180,
                  child: PrettyQrView.data(
                    data: 'XXXXZZZ9090AAA',
                  ),
                ),
                const Text(
                  "Lorem Ipsum Dolor Sit Amet Event Indonesia",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                DottedBorder(
                  dashPattern: const <double>[6, 8],
                  padding: EdgeInsets.zero,
                  child: const SizedBox(
                    width: double.maxFinite,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 45),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Tiket",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Tribun Utara",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 18),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Waktu",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "15 Jan 2000 18:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10, top: 18),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Tempat",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Blok Jumat, kecamatan Jatitujuh, kabupaten Majalengka, Jawa Barat",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
