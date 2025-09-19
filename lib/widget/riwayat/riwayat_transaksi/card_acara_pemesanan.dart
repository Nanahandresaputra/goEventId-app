import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
                  height: ResponsiveBreakpoints.of(context).isTablet ? 110 : 85,
                  width: ResponsiveBreakpoints.of(context).isTablet ? 110 : 85,
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveBreakpoints.of(context).isTablet
                            ? 20
                            : 16,
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
                          Icon(
                            CupertinoIcons.ticket,
                            size: ResponsiveBreakpoints.of(context).isTablet
                                ? 26
                                : 18,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${data?.tipeTiket}',
                            // softWrap: false,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize:
                                    ResponsiveBreakpoints.of(context).isTablet
                                        ? 16
                                        : 12),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.text_badge_checkmark,
                            size: ResponsiveBreakpoints.of(context).isTablet
                                ? 26
                                : 18,
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${data?.kodePemesanan}',
                            // softWrap: false,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize:
                                    ResponsiveBreakpoints.of(context).isTablet
                                        ? 16
                                        : 12),
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
