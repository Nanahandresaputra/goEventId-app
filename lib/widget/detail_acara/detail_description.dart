import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:go_event_id/widget/atoms/catetori_tag.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DetailDescription extends StatelessWidget {
  final String? dateEvent;
  final String? address;
  final String? description;
  final String? mapTicketImg;
  final String? eventName;
  final Kategori? kategori;
  const DetailDescription(
      {this.dateEvent,
      this.eventName,
      this.address,
      this.description,
      this.mapTicketImg,
      this.kategori,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CategoriTag(
          kategori: kategori,
        ),
        Text(
          '$eventName',
          style: TextStyle(
            fontSize: ResponsiveBreakpoints.of(context).isTablet ? 30 : 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.date_range_outlined,
              color: Colors.black38,
              size: ResponsiveBreakpoints.of(context).isTablet ? 30 : 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$dateEvent',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize:
                      ResponsiveBreakpoints.of(context).isTablet ? 16 : 12),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.location_on_sharp,
              color: Colors.black38,
              size: ResponsiveBreakpoints.of(context).isTablet ? 30 : 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(
              '$address',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize:
                      ResponsiveBreakpoints.of(context).isTablet ? 16 : 12),
            )),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        Text(
          'Deskripsi',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveBreakpoints.of(context).isTablet ? 20 : 16),
        ),
        Html(
          data: ''' $description ''',
          style: {
            'p': Style(
                fontSize: ResponsiveBreakpoints.of(context).isTablet
                    ? FontSize.larger
                    : FontSize.medium)
          },
        ),
        const SizedBox(
          height: 17,
        ),
        // Image(image: AssetImage('assets/img/map-ticket-dummy.png'))
        SizedBox(
            height: ResponsiveBreakpoints.of(context).isTablet ? 400 : 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PhotoView(
                  imageProvider: mapTicketImg is String
                      ? MemoryImage(base64Decode(mapTicketImg!))
                      : const AssetImage('assets/img/event-banner-dummy.png')),
            )),
      ],
    );
  }
}
