// To parse this JSON data, do
//
//     final listAcaraModel = listAcaraModelFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

ListAcaraModel listAcaraModelFromJson(String str) =>
    ListAcaraModel.fromJson(json.decode(str));

String listAcaraModelToJson(ListAcaraModel data) => json.encode(data.toJson());

class ListAcaraModel {
  String message;
  int statusCode;
  List<Datum> data;

  ListAcaraModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ListAcaraModel.fromJson(Map<String, dynamic> json) => ListAcaraModel(
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
  String namaAcara;
  Kategori kategori;
  String waktuAcara;
  String deskripsi;
  String status;
  Kabupatenkota provinsi;
  Kabupatenkota kabupatenkota;
  String alamat;
  String bannerImg;
  String mapTiketImg;
  Kabupatenkota penyelenggara;

  Datum({
    required this.id,
    required this.namaAcara,
    required this.kategori,
    required this.waktuAcara,
    required this.deskripsi,
    required this.status,
    required this.provinsi,
    required this.kabupatenkota,
    required this.alamat,
    required this.bannerImg,
    required this.mapTiketImg,
    required this.penyelenggara,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    DateTime parseDate = DateTime.parse(json["waktu_acara"]);
    String fomatDate = DateFormat('dd MMM yyyy HH:mm').format(parseDate);
    return Datum(
      id: json["id"],
      namaAcara: json["nama_acara"],
      kategori: Kategori.fromJson(json["kategori"]),
      waktuAcara: fomatDate,
      deskripsi: json["deskripsi"],
      status: json["status"],
      provinsi: Kabupatenkota.fromJson(json["provinsi"]),
      kabupatenkota: Kabupatenkota.fromJson(json["kabupatenkota"]),
      alamat: json["alamat"],
      bannerImg: json["banner_img"],
      mapTiketImg: json["map_tiket_img"],
      penyelenggara: Kabupatenkota.fromJson(json["penyelenggara"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_acara": namaAcara,
        "kategori": kategori.toJson(),
        "waktu_acara": waktuAcara,
        "deskripsi": deskripsi,
        "status": status,
        "provinsi": provinsi.toJson(),
        "kabupatenkota": kabupatenkota.toJson(),
        "alamat": alamat,
        "banner_img": bannerImg,
        "map_tiket_img": mapTiketImg,
        "penyelenggara": penyelenggara.toJson(),
      };
}

class Kabupatenkota {
  int id;
  String nama;

  Kabupatenkota({
    required this.id,
    required this.nama,
  });

  factory Kabupatenkota.fromJson(Map<String, dynamic> json) => Kabupatenkota(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}

class Kategori {
  int id;
  String namaKategori;

  Kategori({
    required this.id,
    required this.namaKategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        namaKategori: json["nama_kategori"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kategori": namaKategori,
      };
}
