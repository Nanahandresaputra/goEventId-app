import 'package:flutter/material.dart';

class CategoriesBar extends StatefulWidget {
  final double borderRadius;
  const CategoriesBar({super.key, this.borderRadius = 8});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  late List<bool> isHoverList = [false, false, false, false, false];
  int _currentIndex = 0;

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
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: List.generate(
                5,
                (index) {
                  return Container(
                    height: 60,
                    margin: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
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
                              [
                                Icons.list_outlined,
                                Icons.festival_rounded,
                                Icons.sports_soccer_rounded,
                                Icons.add_reaction_rounded,
                                Icons.music_off_outlined,
                              ][index],
                              color: const Color(0xFF235347),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              [
                                'Semua',
                                'Festival',
                                'Olahraga',
                                'Pertunjukan',
                                'Konser'
                              ][index],
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
        ),
      ],
    );
  }
}
