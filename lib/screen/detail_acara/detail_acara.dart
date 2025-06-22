import 'package:flutter/material.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/widget/atoms/catetori_tag.dart';
import 'package:go_event_id/widget/detail_acara/detail_description.dart';

class DetailAcara extends StatefulWidget {
  const DetailAcara({super.key});

  @override
  State<DetailAcara> createState() => _DetailAcaraState();
}

class _DetailAcaraState extends State<DetailAcara> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              toolbarHeight: 200,
              leading: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListAcara()));
                  },
                  icon: const Icon(
                    Icons.arrow_back_outlined,
                  ),
                  style: IconButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(167, 255, 255, 255)),
                ),
              ),
              // expandedHeight: 100,
              floating: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                  image: AssetImage('assets/img/event-banner-dummy.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate.fixed(<Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const <Widget>[DetailDescription()],
                  ))
            ]))
          ],
        ),
      ),
    );
  }
}
