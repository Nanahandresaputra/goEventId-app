import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/acara/acara_bloc.dart';
import 'package:go_event_id/feature/bloc/pemesanan/pemesanan_bloc.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/widget/acara/list_content.dart';
import 'package:go_event_id/widget/atoms/categories_bar.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/atoms/search_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAcara extends StatefulWidget {
  const ListAcara({super.key});

  @override
  State<ListAcara> createState() => _ListAcaraState();
}

class _ListAcaraState extends State<ListAcara> {
  TextEditingController searchText = TextEditingController();
  String searchVal = '';
  int filterCategori = 0;
  double scrollVal = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AcaraBloc, AcaraState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (state is AcaraError) {
              if (state.apiExeception!.statusCode == 401) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
              } else if (state.apiExeception!.statusCode != 500) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(state.apiExeception!.message!),
                          ));
                });
              }
            }
          });
          return BlocBuilder<PemesananBloc, PemesananState>(
            builder: (context, statePemesanan) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      searchVal == '' && scrollVal == 0 ? 230 : 70),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      // color: Colors.green,
                      height: searchVal == '' && scrollVal == 0 ? 280 : 100,
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
                            height: searchVal == '' && scrollVal == 0 ? 18 : 0,
                          ),
                          searchVal == '' && scrollVal == 0
                              ? const Image(
                                  image: AssetImage('assets/img/banner.png'))
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: const Footer(
                  defaultCurrent: 1,
                ),
                body: SingleChildScrollView(
                  child: NotificationListener<ScrollEndNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.axis.name == 'vertical') {
                        setState(() {
                          scrollVal = notification.metrics.pixels;
                        });
                      }

                      return true;
                    },
                    child: Container(
                        color: Colors.white,
                        padding:
                            const EdgeInsets.only(top: 14, left: 20, right: 20),
                        // height: MediaQuery.of(context).size.height * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            searchVal == ''
                                ? CategoriesBar(
                                    onChange: (id) {
                                      setState(() {
                                        filterCategori = id;
                                      });
                                    },
                                  )
                                : Text(
                                    'Hasil pencarian "${searchText.text}"',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                            SizedBox(
                              height: searchVal == '' ? 30 : 10,
                            ),
                            SizedBox(
                              height: searchVal == '' && scrollVal == 0
                                  ? MediaQuery.of(context).size.height * 0.5
                                  : MediaQuery.of(context).size.height * 0.75,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(bottom: 100),
                                physics: const ScrollPhysics(),
                                child: ListContent(
                                  filterCategory: filterCategori,
                                  filterSearch: searchVal,
                                  state: state,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
