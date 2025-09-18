import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/pemesanan/pemesanan_bloc.dart';
import 'package:go_event_id/feature/bloc/tiket_acara/tiket_acara_bloc.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:go_event_id/screen/acara/list_acara.dart';
import 'package:go_event_id/screen/auth/login.dart';
import 'package:go_event_id/screen/payment/payment.dart';
import 'package:go_event_id/widget/atoms/custom_elevated_btn.dart';
import 'package:go_event_id/widget/detail_acara/detail_description.dart';
import 'package:go_event_id/widget/detail_acara/detail_ticket.dart';
import 'package:go_event_id/widget/detail_acara/terms_condition.dart';
import 'package:go_event_id/widget/execption_message/network_error.dart';
import 'package:go_event_id/widget/utils/panara_dialog.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailAcara extends StatefulWidget {
  final Datum? data;
  const DetailAcara({this.data, super.key});

  @override
  State<DetailAcara> createState() => _DetailAcaraState();
}

class _DetailAcaraState extends State<DetailAcara> {
  Map<String, dynamic> reqPemesanan = {};

  @override
  void initState() {
    super.initState();

    context
        .read<TiketAcaraBloc>()
        .add(GetTiketAcaraEvent(acaraId: '${widget.data!.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TiketAcaraBloc, TiketAcaraState>(
      builder: (context, stateTiketAcara) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (stateTiketAcara is TiketAcaraError) {
            if (stateTiketAcara.apiExeception!.statusCode == 401) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();
            } else if (stateTiketAcara.apiExeception!.statusCode != 500) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showModernDialog(
                    context,
                    "Terjadi Kesalahan!",
                    stateTiketAcara.apiExeception!.message!,
                    "Mengerti",
                    PanaraDialogType.error);
              });
            }
          }
        });

        return BlocBuilder<PemesananBloc, PemesananState>(
          builder: (context, statePemesanan) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (statePemesanan is PemesananError) {
                if (statePemesanan.apiExeception!.statusCode == 401) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                  final prefs = await SharedPreferences.getInstance();
                  prefs.clear();
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showModernDialog(
                        context,
                        "Terjadi Kesalahan!",
                        statePemesanan.apiExeception!.message!,
                        "Mengerti",
                        PanaraDialogType.error);
                  });
                }
              } else if (statePemesanan is PemesananSuccess) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Payment(
                            snapMidtransUrl: statePemesanan
                                .pemesnanModel.data.redirectUrl)));
              }
            });
            return Scaffold(
              backgroundColor: Colors.white,
              bottomNavigationBar: reqPemesanan['tiket_acara_id'] != null
                  ? Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 6),
                                blurRadius: 10)
                          ]),
                      child: CustomElevatedBtn(
                        isLoading: statePemesanan is PemesananLoading,
                        onPressed: () async {
                          context.read<PemesananBloc>().add(
                              PostPemesananEvent(pemesananBody: reqPemesanan));

                          await Future.delayed(const Duration(seconds: 1));
                        },
                        label: 'Beli Tiket',
                      ))
                  : const SizedBox(),
              body: stateTiketAcara is TiketAcaraError &&
                      stateTiketAcara.apiExeception!.statusCode == 500
                  ? NetworkError(
                      onReload: () {
                        context.read<TiketAcaraBloc>().add(
                            GetTiketAcaraEvent(acaraId: '${widget.data!.id}'));
                      },
                    )
                  : CustomScrollView(
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
                                        builder: (context) =>
                                            const ListAcara()));
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
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image(
                              image: widget.data?.bannerImg is String
                                  ? MemoryImage(
                                      base64Decode(widget.data!.bannerImg))
                                  : const AssetImage(
                                      'assets/img/event-banner-dummy.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate.fixed(<Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            child: DetailDescription(
                              kategori: widget.data?.kategori,
                              eventName: widget.data?.namaAcara,
                              dateEvent: widget.data?.waktuAcara,
                              address:
                                  '${widget.data?.alamat}, ${widget.data?.kabupatenkota.nama}, ${widget.data?.provinsi.nama}',
                              mapTicketImg: widget.data?.mapTiketImg,
                              description: widget.data?.deskripsi,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 35,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, right: 20, left: 20),
                            child: DetailTicket(
                              onChange: (tiketAcaraId) {
                                setState(() {
                                  reqPemesanan = {
                                    "tiket_acara_id": tiketAcaraId,
                                    "ticketQty": 1
                                  };
                                });
                              },
                              state: stateTiketAcara,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          const Padding(
                              padding:
                                  EdgeInsets.only(top: 20, right: 20, left: 20),
                              child: TermsCondition()),
                          const SizedBox(
                            height: 30,
                          ),
                        ]))
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
