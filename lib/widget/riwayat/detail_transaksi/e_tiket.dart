import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ETiket extends StatelessWidget {
  final dynamic data;
  const ETiket({super.key, this.data});

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
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Image(
                fit: BoxFit.cover,
                image: data?.bannerImg is String
                    ? MemoryImage(base64Decode(data!.bannerImg))
                    : const AssetImage('assets/img/event-banner-dummy.png'),
                height: ResponsiveBreakpoints.of(context).isTablet ? 200 : 85,
                width: double.maxFinite,
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Kode Booking',
                      style: TextStyle(
                          fontSize: ResponsiveBreakpoints.of(context).isTablet
                              ? 18
                              : 14),
                    ),
                    Text('${data?.kodeOrder}',
                        style: TextStyle(
                            fontSize: ResponsiveBreakpoints.of(context).isTablet
                                ? 18
                                : 14)),
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
                    data: '${data?.kodeOrder}',
                  ),
                ),
                Text(
                  '${data?.acara}',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize:
                        ResponsiveBreakpoints.of(context).isTablet ? 24 : 18,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Tiket",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${data?.tipeTiket}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w500),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Waktu",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${data?.waktuAcara}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w500),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Tempat",
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '${data?.tempatAcara}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize:
                                  ResponsiveBreakpoints.of(context).isTablet
                                      ? 20
                                      : 16,
                              fontWeight: FontWeight.w500),
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
