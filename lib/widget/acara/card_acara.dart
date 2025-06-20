import 'package:flutter/material.dart';

class CardAcara extends StatelessWidget {
  const CardAcara({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/event-banner-dummy.png'),
                  height: 120,
                  width: 400,
                  // height: 80,
                  // width: 80,
                )),
            SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  maxLines: 2,
                  "Lorem Ipsum Dolor Sit Amet Event Indonesia",
                  // softWrap: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "12 Jan 2025",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black38),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Kelapa Gading, Jakarta Utara",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black38),
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
