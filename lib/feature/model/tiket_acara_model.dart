// To parse this JSON data, do
//
//     final tiketAcaraModel = tiketAcaraModelFromJson(jsonString);

import 'dart:convert';

TiketAcaraModel tiketAcaraModelFromJson(String str) =>
    TiketAcaraModel.fromJson(json.decode(str));

String tiketAcaraModelToJson(TiketAcaraModel data) =>
    json.encode(data.toJson());

class TiketAcaraModel {
  String message;
  int statusCode;
  List<Datum> data;

  TiketAcaraModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory TiketAcaraModel.fromJson(Map<String, dynamic> json) =>
      TiketAcaraModel(
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
  String tipeTiket;
  int kuota;
  int tiketTerjual;
  int hargaTiket;
  String kategori;
  int stokTersisa;

  Datum({
    required this.id,
    required this.acara,
    required this.tipeTiket,
    required this.kuota,
    required this.tiketTerjual,
    required this.hargaTiket,
    required this.kategori,
    required this.stokTersisa,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        acara: json["acara"],
        tipeTiket: json["tipe_tiket"],
        kuota: json["kuota"],
        tiketTerjual: json["tiket_terjual"],
        hargaTiket: json["harga_tiket"],
        kategori: json["kategori"],
        stokTersisa: json["stok_tersisa"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "acara": acara,
        "tipe_tiket": tipeTiket,
        "kuota": kuota,
        "tiket_terjual": tiketTerjual,
        "harga_tiket": hargaTiket,
        "kategori": kategori,
        "stok_tersisa": stokTersisa,
      };
}
