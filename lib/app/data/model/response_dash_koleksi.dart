/// status : 200
/// total : 1
/// data : [{"KoleksiID":1,"UserID":2,"BukuID":1,"createAt":"2024-03-29T00:30:31.590Z","updateAt":"2024-03-29T00:30:31.590Z","buku":{"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"status":"diPinjamkan","createAt":"2024-03-29T00:04:47.009Z","updateAt":"2024-03-29T00:29:45.867Z"},"user":{"UserID":2,"Username":null,"Password":"$2b$10$wtnQas7Z3/EhlyYWEU9Lg.nGKGwhe4l1yOd2QITF0Z4rkTVf9mdXy","Email":"namagakpunya325@gmail.com","NamaLengkap":"NoName","Alamat":null,"role":"anggota","createAt":"2024-03-28T23:55:06.212Z","updateAt":"2024-03-28T23:55:06.212Z"}}]

class ResponseDashKoleksi {
  ResponseDashKoleksi({
      this.status, 
      this.total, 
      this.data,});

  ResponseDashKoleksi.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDashKoleksi.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataDashKoleksi>? data;

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

/// KoleksiID : 1
/// UserID : 2
/// BukuID : 1
/// createAt : "2024-03-29T00:30:31.590Z"
/// updateAt : "2024-03-29T00:30:31.590Z"
/// buku : {"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"status":"diPinjamkan","createAt":"2024-03-29T00:04:47.009Z","updateAt":"2024-03-29T00:29:45.867Z"}
/// user : {"UserID":2,"Username":null,"Password":"$2b$10$wtnQas7Z3/EhlyYWEU9Lg.nGKGwhe4l1yOd2QITF0Z4rkTVf9mdXy","Email":"namagakpunya325@gmail.com","NamaLengkap":"NoName","Alamat":null,"role":"anggota","createAt":"2024-03-28T23:55:06.212Z","updateAt":"2024-03-28T23:55:06.212Z"}

class DataDashKoleksi {
  DataDashKoleksi({
      this.koleksiID, 
      this.userID, 
      this.bukuID, 
      this.createAt, 
      this.updateAt, 
      this.buku, 
      this.user,});

  DataDashKoleksi.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? koleksiID;
  int? userID;
  int? bukuID;
  String? createAt;
  String? updateAt;
  Buku? buku;
  User? user;

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
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// UserID : 2
/// Username : null
/// Password : "$2b$10$wtnQas7Z3/EhlyYWEU9Lg.nGKGwhe4l1yOd2QITF0Z4rkTVf9mdXy"
/// Email : "namagakpunya325@gmail.com"
/// NamaLengkap : "NoName"
/// Alamat : null
/// role : "anggota"
/// createAt : "2024-03-28T23:55:06.212Z"
/// updateAt : "2024-03-28T23:55:06.212Z"

class User {
  User({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createAt, 
      this.updateAt,});

  User.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['role'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? userID;
  dynamic username;
  String? password;
  String? email;
  String? namaLengkap;
  dynamic alamat;
  String? role;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Password'] = password;
    map['Email'] = email;
    map['NamaLengkap'] = namaLengkap;
    map['Alamat'] = alamat;
    map['role'] = role;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
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
/// status : "diPinjamkan"
/// createAt : "2024-03-29T00:04:47.009Z"
/// updateAt : "2024-03-29T00:29:45.867Z"

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
    map['status'] = status;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}