/// status : 200
/// total : 1
/// data : [{"KategoriID":1,"NamaKategori":"Manhwa","createAt":"2024-02-23T12:56:46.847Z","updateAt":"2024-02-23T12:56:46.847Z","buku":[{"KategoriBukuID":2,"BukuID":3,"KategoriID":1,"createAt":"2024-03-01T11:53:21.753Z","updateAt":"2024-03-01T11:53:21.753Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}}]}]

class ResponseKategori {
  ResponseKategori({
      this.status, 
      this.total, 
      this.data,});

  ResponseKategori.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKategori.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataKategori>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// KategoriID : 1
/// NamaKategori : "Manhwa"
/// createAt : "2024-02-23T12:56:46.847Z"
/// updateAt : "2024-02-23T12:56:46.847Z"
/// buku : [{"KategoriBukuID":2,"BukuID":3,"KategoriID":1,"createAt":"2024-03-01T11:53:21.753Z","updateAt":"2024-03-01T11:53:21.753Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}}]

class DataKategori {
  DataKategori({
      this.kategoriID, 
      this.namaKategori, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  DataKategori.fromJson(dynamic json) {
    kategoriID = json['KategoriID'];
    namaKategori = json['NamaKategori'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    if (json['buku'] != null) {
      buku = [];
      json['buku'].forEach((v) {
        buku?.add(KategoriBukuRelasi.fromJson(v));
      });
    }
  }
  int? kategoriID;
  String? namaKategori;
  String? createAt;
  String? updateAt;
  List<KategoriBukuRelasi>? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriID'] = kategoriID;
    map['NamaKategori'] = namaKategori;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (buku != null) {
      map['buku'] = buku?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// KategoriBukuID : 2
/// BukuID : 3
/// KategoriID : 1
/// createAt : "2024-03-01T11:53:21.753Z"
/// updateAt : "2024-03-01T11:53:21.753Z"
/// buku : {"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}

class KategoriBukuRelasi {
  KategoriBukuRelasi({
      this.kategoriBukuID, 
      this.bukuID, 
      this.kategoriID, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  KategoriBukuRelasi.fromJson(dynamic json) {
    kategoriBukuID = json['KategoriBukuID'];
    bukuID = json['BukuID'];
    kategoriID = json['KategoriID'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? kategoriBukuID;
  int? bukuID;
  int? kategoriID;
  String? createAt;
  String? updateAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriBukuID'] = kategoriBukuID;
    map['BukuID'] = bukuID;
    map['KategoriID'] = kategoriID;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }

}

/// BukuID : 3
/// Judul : "Strike Wak!"
/// Penulis : "Rido"
/// Penerbit : "Pamit"
/// TahunTerbit : 2024
/// deskripsi : "Kesedihan Rido Pamit tiktok"
/// stok : 10
/// cover : null
/// createAt : "2024-02-24T07:57:51.447Z"
/// updateAt : "2024-02-24T07:57:51.447Z"

class Buku {
  Buku({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.deskripsi, 
      this.stok, 
      this.cover, 
      this.createAt, 
      this.updateAt,});

  Buku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    deskripsi = json['deskripsi'];
    stok = json['stok'];
    cover = json['cover'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? deskripsi;
  int? stok;
  dynamic cover;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['deskripsi'] = deskripsi;
    map['stok'] = stok;
    map['cover'] = cover;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}