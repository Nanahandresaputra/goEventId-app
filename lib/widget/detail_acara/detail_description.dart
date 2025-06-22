import 'package:flutter/material.dart';
import 'package:go_event_id/widget/atoms/catetori_tag.dart';
import 'package:photo_view/photo_view.dart';

class DetailDescription extends StatelessWidget {
  const DetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CategoriTag(),
        const Text(
          'Lorem Ipsum Dolor Sit Amet Event Indonesia',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          children: <Widget>[
            Icon(
              Icons.date_range_outlined,
              color: Colors.black38,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '12 Jan 2025',
              style: TextStyle(color: Colors.black38),
            )
          ],
        ),
        const Row(
          children: <Widget>[
            Icon(
              Icons.location_on_sharp,
              color: Colors.black38,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Kelapa Gading, Jakarta Utara',
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        const Text(
          'Deskripsi',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 17,
        ),
        // Image(image: AssetImage('assets/img/map-ticket-dummy.png'))
        SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: PhotoView(
                  imageProvider:
                      const AssetImage('assets/img/map-ticket-dummy.png')),
            )),
      ],
    );
  }
}
