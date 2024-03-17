/// status : 200
/// message : "Create bookmark successful"
/// data : {"KoleksiID":2,"UserID":1,"BukuID":1,"createAt":"2024-03-17T06:55:19.526Z","updateAt":"2024-03-17T06:55:19.526Z","buku":{"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"file":null,"status":"belumDipinjam","createAt":"2024-03-14T12:16:32.396Z","updateAt":"2024-03-17T18:55:39.975Z"}}

class ResponseKoleksiPribadi {
  ResponseKoleksiPribadi({
      this.status, 
      this.message, 
      this.data,});

  ResponseKoleksiPribadi.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataKoleksiPribadi.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataKoleksiPribadi? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// KoleksiID : 2
/// UserID : 1
/// BukuID : 1
/// createAt : "2024-03-17T06:55:19.526Z"
/// updateAt : "2024-03-17T06:55:19.526Z"
/// buku : {"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"file":null,"status":"belumDipinjam","createAt":"2024-03-14T12:16:32.396Z","updateAt":"2024-03-17T18:55:39.975Z"}

class DataKoleksiPribadi {
  DataKoleksiPribadi({
      this.koleksiID, 
      this.userID, 
      this.bukuID, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  DataKoleksiPribadi.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? koleksiID;
  int? userID;
  int? bukuID;
  String? createAt;
  String? updateAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KoleksiID'] = koleksiID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (buku != null) {
      map['buku'] = buku?.toJson();
    }
    return map;
  }

}

/// BukuID : 1
/// Judul : "Solo Leveling"
/// Penulis : "Chugong"
/// Penerbit : "Gemar Baca"
/// TahunTerbit : 2018
/// deskripsi : null
/// stok : 10
/// cover : null
/// file : null
/// status : "belumDipinjam"
/// createAt : "2024-03-14T12:16:32.396Z"
/// updateAt : "2024-03-17T18:55:39.975Z"

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
      this.file, 
      this.status, 
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
    file = json['file'];
    status = json['status'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  dynamic deskripsi;
  int? stok;
  dynamic cover;
  dynamic file;
  String? status;
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
    map['file'] = file;
    map['status'] = status;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}