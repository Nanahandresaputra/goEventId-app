import 'package:flutter/material.dart';

class AcaraInfo extends StatelessWidget {
  const AcaraInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // padding: const EdgeInsets.all(8),
        // decoration: BoxDecoration(
        //     border: Border.all(color: const Color(0xFF235347)),
        //     borderRadius: BorderRadius.circular(15)),
        const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/event-banner-dummy.png'),
              height: 70,
              width: 70,
            )),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                maxLines: 2,
                "Lorem Ipsum Dolor Sit Amet Event Indonesia",
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range_outlined,
                    color: Colors.black38,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "12 Jan 2025 18:00",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black38),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.black38,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    child: Text(
                      "Blok Jumat, kecamatan Jatitujuh, kabupaten Majalengka, Jawa Barat",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black38),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
