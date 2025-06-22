import 'package:flutter/material.dart';
import 'package:go_event_id/widget/acara/list_content.dart';
import 'package:go_event_id/widget/atoms/categories_bar.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/atoms/search_field.dart';

class ListAcara extends StatefulWidget {
  const ListAcara({super.key});

  @override
  State<ListAcara> createState() => _ListAcaraState();
}

class _ListAcaraState extends State<ListAcara> {
  TextEditingController searchText = TextEditingController();
  String searchVal = '';
  double scrollVal = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(searchVal == '' && scrollVal == 0.0 ? 230 : 70),
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              // color: Colors.green,
              height: searchVal == '' && scrollVal == 0.0 ? 280 : 100,
              // margin:
              //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.89,
                        child: SearchInput(
                          onChange: (val) {
                            setState(() {
                              searchVal = val;
                            });
                          },
                          hintText: 'Cari',
                          textController: searchText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: searchVal == '' && scrollVal == 0.0 ? 18 : 0,
                  ),
                  searchVal == '' && scrollVal == 0.0
                      ? const Image(image: AssetImage('assets/img/banner.png'))
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const Footer(),
        body: SingleChildScrollView(
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              setState(() {
                scrollVal = notification.metrics.pixels;
              });

              return true;
            },
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 14, left: 20, right: 20),
                // height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    searchVal == ''
                        ? const CategoriesBar()
                        : Text(
                            'Hasil pencarian "${searchText.text}"',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                    SizedBox(
                      height: searchVal == '' ? 30 : 10,
                    ),
                    SizedBox(
                      height: searchVal == '' && scrollVal == 0.0
                          ? MediaQuery.of(context).size.height * 0.5
                          : MediaQuery.of(context).size.height * 0.75,
                      child: const SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 100),
                        physics: ScrollPhysics(),
                        child: ListContent(),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
