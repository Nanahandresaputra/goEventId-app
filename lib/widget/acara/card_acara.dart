import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CardAcara extends StatelessWidget {
  final Datum? data;
  final Function onPress;
  const CardAcara({required this.onPress, this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4, offset: Offset(0, 5))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF84AF94), width: 0.5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image(
                    fit: BoxFit.cover,
                    image: data?.bannerImg is String
                        ? MemoryImage(base64Decode(data!.bannerImg))
                        : const AssetImage('assets/img/event-banner-dummy.png'),
                    height:
                        ResponsiveBreakpoints.of(context).isTablet ? 200 : 120,
                    width: double.infinity
                    // : 400,
                    // height: 80,
                    // width: 80,
                    )),
            const SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  maxLines: 2,
                  '${data?.namaAcara}',
                  // softWrap: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ResponsiveBreakpoints.of(context).isTablet ? 24 : 16,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${data?.waktuAcara}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                      fontSize:
                          ResponsiveBreakpoints.of(context).isTablet ? 20 : 12),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${data?.kabupatenkota.nama}, ${data?.provinsi.nama}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black38,
                      fontSize:
                          ResponsiveBreakpoints.of(context).isTablet ? 20 : 12),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
