// To parse this JSON data, do
//
//     final riwayatModel = riwayatModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

RiwayatModel riwayatModelFromJson(String str) =>
    RiwayatModel.fromJson(json.decode(str));

String riwayatModelToJson(RiwayatModel data) => json.encode(data.toJson());

class RiwayatModel {
  String message;
  int statusCode;
  List<Datum> data;

  RiwayatModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory RiwayatModel.fromJson(Map<String, dynamic> json) => RiwayatModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String acara;
  String kodeOrder;
  String kodePemesanan;
  String statusOrder;
  String statusPembayaran;
  String tipeTiket;
  String waktuAcara;
  DateTime createdat;
  String tempatAcara;
  String bannerImg;

  Datum({
    required this.id,
    required this.acara,
    required this.kodeOrder,
    required this.kodePemesanan,
    required this.statusOrder,
    required this.statusPembayaran,
    required this.tipeTiket,
    required this.waktuAcara,
    required this.createdat,
    required this.tempatAcara,
    required this.bannerImg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    DateTime parseDate = DateTime.parse(json["waktu_acara"]);
    String fomatDate = DateFormat('dd MMM yyyy HH:mm').format(parseDate);

    return Datum(
      id: json["id"],
      acara: json["acara"],
      kodeOrder: json["kode_order"],
      kodePemesanan: json["kode_pemesanan"],
      statusOrder: json["status_order"],
      statusPembayaran: json["status_pembayaran"],
      tipeTiket: json["tipe_tiket"],
      waktuAcara: fomatDate,
      createdat: DateTime.parse(json["createdat"]),
      tempatAcara: json["tempat_acara"],
      bannerImg: json["banner_img"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "acara": acara,
        "kode_order": kodeOrder,
        "kode_pemesanan": kodePemesanan,
        "status_order": statusOrder,
        "status_pembayaran": statusPembayaran,
        "tipe_tiket": tipeTiket,
        "waktu_acara": waktuAcara,
        "createdat": createdat.toIso8601String(),
        "tempat_acara": tempatAcara,
        "banner_img": bannerImg,
      };
}
