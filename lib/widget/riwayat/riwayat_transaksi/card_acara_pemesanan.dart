import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';

class CardAcaraPemesanan extends StatelessWidget {
  final dynamic data;

  const CardAcaraPemesanan({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailTransaksi(
                      data: data,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 5))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF84AF94), width: 0.5)),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image(
                  fit: BoxFit.cover,
                  image: data?.bannerImg is String
                      ? MemoryImage(base64Decode(data!.bannerImg))
                      : const AssetImage('assets/img/event-banner-dummy.png'),
                  height: 85,
                  width: 85,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    maxLines: 2,
                    '${data?.acara}',
                    softWrap: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Icon(
                            CupertinoIcons.ticket,
                            size: 18,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${data?.tipeTiket}',
                            // softWrap: false,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            CupertinoIcons.text_badge_checkmark,
                            size: 18,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${data?.kodePemesanan}',
                            // softWrap: false,
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
