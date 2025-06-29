import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:go_event_id/widget/atoms/catetori_tag.dart';
import 'package:photo_view/photo_view.dart';

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
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            const Icon(
              Icons.date_range_outlined,
              color: Colors.black38,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$dateEvent',
              style: TextStyle(color: Colors.black38),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Icon(
              Icons.location_on_sharp,
              color: Colors.black38,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(
              '$address',
              style: const TextStyle(color: Colors.black38),
            )),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        const Text(
          'Deskripsi',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          "$description",
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 17,
        ),
        // Image(image: AssetImage('assets/img/map-ticket-dummy.png'))
        SizedBox(
            height: 300,
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
