import 'package:flutter/material.dart';
import 'package:go_event_id/screen/detail_acara/detail_acara.dart';
import 'package:go_event_id/widget/acara/card_acara.dart';

class ListContent extends StatelessWidget {
  const ListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black26, width: 1)),
              child: CardAcara(
                onPress: () {
                  print('press');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailAcara(),
                      ));
                },
              ),
            );
          }),
    );
  }
}
