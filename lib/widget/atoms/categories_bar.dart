import 'package:flutter/material.dart';
import 'package:go_event_id/feature/model/acara_model.dart';

class CategoriesBar extends StatefulWidget {
  final double borderRadius;
  final void Function(int) onChange;
  const CategoriesBar(
      {super.key, required this.onChange, this.borderRadius = 8});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  late List<bool> isHoverList = [false, false, false, false, false];
  int _currentIndex = 0;

  List<Map<String, dynamic>> kategoriData = [
    {"id": 0, "namaKategori": 'Semua', "icon": Icons.list_outlined},
    {"id": 1, "namaKategori": 'Olahraga', "icon": Icons.sports_soccer_rounded},
    {
      "id": 2,
      "namaKategori": 'Pertunjukan',
      "icon": Icons.add_reaction_rounded
    },
    {"id": 3, "namaKategori": 'Konser', "icon": Icons.music_note_sharp},
    {"id": 4, "namaKategori": 'Festival', "icon": Icons.festival_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Kategori',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 73,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: kategoriData.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 60,
                  margin: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = kategoriData[index]['id'];
                        widget.onChange(kategoriData[index]['id']);
                      });
                    },
                    onHover: (value) {
                      setState(() {
                        isHoverList[index] = value;
                      });
                    },
                    child: AnimatedContainer(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBF0DD),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        border: _currentIndex == index || isHoverList[index]
                            ? Border.all(color: const Color(0xFF235347))
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            kategoriData[index]['icon'],
                            color: const Color(0xFF235347),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '${kategoriData[index]['namaKategori']}',
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF235347)),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
