import 'package:flutter/material.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/payment/payment.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/detail_acara/detail_description.dart';
import 'package:go_event_id/widget/detail_acara/detail_ticket.dart';

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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(14),
          decoration:
              const BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black, offset: Offset(0, 6), blurRadius: 10)
          ]),
          child: CustomElevatedBtn(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Payment()));
            },
            label: 'Beli Tiket',
          ),
        ),
        body: CustomScrollView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SliverAppBar(
              foregroundColor: Colors.green.shade800,
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
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: <Widget>[
                      DetailDescription(),
                      SizedBox(
                        height: 25,
                      ),
                      DetailTicket()
                    ],
                  ))
            ]))
          ],
        ),
      ),
    );
  }
}
