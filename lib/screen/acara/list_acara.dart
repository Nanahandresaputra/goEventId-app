import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_event_id/widget/acara/list_content.dart';
import 'package:go_event_id/widget/atoms/categories_bar.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(searchVal == '' ? 230 : 70),
          child: AppBar(
            backgroundColor: const Color(0xFFDBF0DD),
            flexibleSpace: Container(
              color: const Color(0xFFDBF0DD),
              padding: const EdgeInsets.only(left: 20, right: 20),
              // color: Colors.green,
              height: searchVal == '' ? 280 : 100,
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
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // CustomElevatedBtn(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.search,
                      //     color: Colors.white,
                      //   ),
                      //   width: 70,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: searchVal == '' ? 18 : 0,
                  ),
                  searchVal == ''
                      ? const Image(image: AssetImage('assets/img/banner.png'))
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const Footer(),
        body: Container(
            color: const Color(0xFFDBF0DD),
            padding: const EdgeInsets.only(top: 20),
            // height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
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
                    const ListContent()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
