/// status : 200
/// data : {"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z","koleksi_pribadi":[{"KoleksiID":1,"UserID":2,"BukuID":5,"createAt":"2024-03-08T21:19:00.292Z","updateAt":"2024-03-08T21:19:00.292Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}]}

class ResponseUserKoleksi {
  ResponseUserKoleksi({
      this.status, 
      this.data,});

  ResponseUserKoleksi.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? DataUserKoleksi.fromJson(json['data']) : null;
  }
  int? status;
  DataUserKoleksi? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// UserID : 2
/// Username : null
/// Password : "$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "admin"
/// createAt : "2024-03-07T15:31:04.443Z"
/// updateAt : "2024-03-07T15:31:04.443Z"
/// koleksi_pribadi : [{"KoleksiID":1,"UserID":2,"BukuID":5,"createAt":"2024-03-08T21:19:00.292Z","updateAt":"2024-03-08T21:19:00.292Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}]

class DataUserKoleksi {
  DataUserKoleksi({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createAt, 
      this.updateAt, 
      this.koleksiPribadi,});

  DataUserKoleksi.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['role'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    if (json['koleksi_pribadi'] != null) {
      koleksiPribadi = [];
      json['koleksi_pribadi'].forEach((v) {
        koleksiPribadi?.add(KoleksiPribadi.fromJson(v));
      });
    }
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
  List<KoleksiPribadi>? koleksiPribadi;

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
    if (koleksiPribadi != null) {
      map['koleksi_pribadi'] = koleksiPribadi?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// KoleksiID : 1
/// UserID : 2
/// BukuID : 5
/// createAt : "2024-03-08T21:19:00.292Z"
/// updateAt : "2024-03-08T21:19:00.292Z"
/// buku : {"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}

class KoleksiPribadi {
  KoleksiPribadi({
      this.koleksiID, 
      this.userID, 
      this.bukuID, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  KoleksiPribadi.fromJson(dynamic json) {
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

/// BukuID : 5
/// Judul : "Solo Leveling"
/// Penulis : "Chugong"
/// Penerbit : "Gemar Baca"
/// TahunTerbit : 2018
/// deskripsi : null
/// stok : 10
/// cover : null
/// createAt : "2024-03-08T21:07:51.212Z"
/// updateAt : "2024-03-08T21:07:51.212Z"
/// genreBuku : [{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]

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
      this.updateAt, 
      this.genreBuku,});

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
    if (json['genreBuku'] != null) {
      genreBuku = [];
      json['genreBuku'].forEach((v) {
        genreBuku?.add(KoleksiGenreBukuRelasi.fromJson(v));
      });
    }
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  dynamic deskripsi;
  int? stok;
  dynamic cover;
  String? createAt;
  String? updateAt;
  List<KoleksiGenreBukuRelasi>? genreBuku;

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
    if (genreBuku != null) {
      map['genreBuku'] = genreBuku?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 7
/// bukuId : 5
/// genreBukuId : 1
/// createAt : "2024-03-08T21:07:51.228Z"
/// updateAt : "2024-03-08T21:07:51.228Z"
/// genreBuku : {"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}

class KoleksiGenreBukuRelasi {
  KoleksiGenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  KoleksiGenreBukuRelasi.fromJson(dynamic json) {
    id = json['id'];
    bukuId = json['bukuId'];
    genreBukuId = json['genreBukuId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    genreBuku = json['genreBuku'] != null ? GenreBuku.fromJson(json['genreBuku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  GenreBuku? genreBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bukuId'] = bukuId;
    map['genreBukuId'] = genreBukuId;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (genreBuku != null) {
      map['genreBuku'] = genreBuku?.toJson();
    }
    return map;
  }

}

/// id : 1
/// nama : "Fantasy"
/// createAt : "2024-03-08T20:33:23.103Z"
/// updateAt : "2024-03-08T20:33:23.103Z"

class GenreBuku {
  GenreBuku({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt,});

  GenreBuku.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? id;
  String? nama;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}