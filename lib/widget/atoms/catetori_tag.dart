import 'package:flutter/material.dart';
import 'package:go_event_id/feature/model/acara_model.dart';

class CategoriTag extends StatelessWidget {
  final Kategori? kategori;
  const CategoriTag({this.kategori, super.key});

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
            Icon(
              kategori?.id == 1
                  ? Icons.sports_soccer_rounded
                  : kategori?.id == 2
                      ? Icons.add_reaction_rounded
                      : kategori?.id == 3
                          ? Icons.music_note_sharp
                          : kategori?.id == 4
                              ? Icons.festival_rounded
                              : Icons.not_interested_sharp,
              color: const Color(0xFF235347),
              size: 20,
            ),
            Text(
              '${kategori?.namaKategori}',
              style: const TextStyle(color: Color(0xFF235347), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
