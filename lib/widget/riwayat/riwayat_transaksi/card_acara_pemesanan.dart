import 'package:flutter/material.dart';

class CardAcaraPemesanan extends StatelessWidget {
  const CardAcaraPemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Row(
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
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  maxLines: 2,
                  "Rp. 200000",
                  // softWrap: false,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF173831)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
