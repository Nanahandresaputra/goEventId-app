import 'package:flutter/material.dart';

class CategoriTag extends StatelessWidget {
  final String? label;
  const CategoriTag({this.label = 'Konser', super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color.fromARGB(134, 200, 230, 201),
            border: Border.all(
              color: const Color(0xFF235347),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.music_note,
              color: Color(0xFF235347),
              size: 20,
            ),
            Text(
              '$label',
              style: const TextStyle(color: Color(0xFF235347), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
