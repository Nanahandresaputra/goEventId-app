import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/riwayat/riwayat_bloc.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/screen/riwayat/detail_transaksi.dart';
import 'package:go_event_id/widget/atoms/footer.dart';
import 'package:go_event_id/widget/execption_message/network_error.dart';
import 'package:go_event_id/widget/execption_message/no_data.dart';
import 'package:go_event_id/widget/riwayat/riwayat_transaksi/card_acara_pemesanan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RiwayatTransaksi extends StatefulWidget {
  const RiwayatTransaksi({super.key});

  @override
  State<RiwayatTransaksi> createState() => _RiwayatTransaksiState();
}

class _RiwayatTransaksiState extends State<RiwayatTransaksi> {
  @override
  void initState() {
    super.initState();

    context.read<RiwayatBloc>().add(GetRiwayatEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<RiwayatBloc, RiwayatState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (state is RiwayatError) {
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
          return Scaffold(
            backgroundColor: const Color(0xFF235347),
            appBar: AppBar(
                backgroundColor: const Color(0xFF235347),
                centerTitle: true,
                title: const Text(
                  'Riwayat Pemesanan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                elevation: 8,
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
                      CupertinoIcons.arrow_left,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                )),
            bottomNavigationBar: const Footer(
              defaultCurrent: 0,
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.9,
              child: state is RiwayatError &&
                      state.apiExeception!.statusCode == 500
                  ? NetworkError(
                      onReload: () {
                        context.read<RiwayatBloc>().add(GetRiwayatEvent());
                      },
                    )
                  : state is RiwayatSuccess && state.riwayatModel.data.isEmpty
                      ? const NoData()
                      : Skeletonizer(
                          enabled: state is RiwayatLoading,
                          child: ListView.builder(
                              itemCount: state is RiwayatSuccess
                                  ? state.riwayatModel.data.length
                                  : 5,
                              itemBuilder: (context, index) =>
                                  CardAcaraPemesanan(
                                      data: state is RiwayatSuccess
                                          ? state.riwayatModel.data[index]
                                          : null)),
                        ),
            ),
          );
        },
      ),
    );
  }
}
