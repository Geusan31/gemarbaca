/// message : 200
/// data : {"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"status":"diPinjamkan","createAt":"2024-03-29T00:04:47.009Z","updateAt":"2024-03-29T00:29:45.867Z","kategoryBuku":[{"KategoriBukuID":1,"BukuID":1,"KategoriID":1,"createAt":"2024-03-29T00:04:47.060Z","updateAt":"2024-03-29T00:04:47.060Z","kategoryBuku":{"KategoriID":1,"NamaKategori":"Manhwa","createAt":"2024-03-29T00:04:36.588Z","updateAt":"2024-03-29T00:04:36.588Z"}}],"genreBuku":[{"id":1,"bukuId":1,"genreBukuId":1,"createAt":"2024-03-29T00:04:47.046Z","updateAt":"2024-03-29T00:04:47.046Z","genreBuku":{"id":1,"nama":"Action","createAt":"2024-03-29T00:04:20.814Z","updateAt":"2024-03-29T00:04:20.814Z"}},{"id":2,"bukuId":1,"genreBukuId":2,"createAt":"2024-03-29T00:04:47.056Z","updateAt":"2024-03-29T00:04:47.056Z","genreBuku":{"id":2,"nama":"Advanture","createAt":"2024-03-29T00:04:26.837Z","updateAt":"2024-03-29T00:04:26.837Z"}},{"id":3,"bukuId":1,"genreBukuId":3,"createAt":"2024-03-29T00:04:47.058Z","updateAt":"2024-03-29T00:04:47.058Z","genreBuku":{"id":3,"nama":"Fantasy","createAt":"2024-03-29T00:04:30.468Z","updateAt":"2024-03-29T00:04:30.468Z"}}],"ulasan":[{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-04-19T13:51:18.236Z","updateAt":"2024-04-19T13:51:18.236Z","user":{"UserID":1,"Username":null,"Password":"$2b$10$mhOrLjx5LYjuPhrq0scIJegY.5Z5c5y/qmunHnCQIbrTE2v/vVU1y","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-28T23:14:51.041Z","updateAt":"2024-03-28T23:14:51.041Z"}}],"episode":[{"id":1,"BukuID":1,"judul":"Chapter 1","file":null,"createAt":"2024-04-19T13:53:50.345Z","updateAt":"2024-04-19T13:53:50.345Z"}],"avgRating":4}

class ResponseDetailBook {
  ResponseDetailBook({
      this.message, 
      this.data,});

  ResponseDetailBook.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDetailBook.fromJson(json['data']) : null;
  }
  int? message;
  DataDetailBook? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
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
/// status : "diPinjamkan"
/// createAt : "2024-03-29T00:04:47.009Z"
/// updateAt : "2024-03-29T00:29:45.867Z"
/// kategoryBuku : [{"KategoriBukuID":1,"BukuID":1,"KategoriID":1,"createAt":"2024-03-29T00:04:47.060Z","updateAt":"2024-03-29T00:04:47.060Z","kategoryBuku":{"KategoriID":1,"NamaKategori":"Manhwa","createAt":"2024-03-29T00:04:36.588Z","updateAt":"2024-03-29T00:04:36.588Z"}}]
/// genreBuku : [{"id":1,"bukuId":1,"genreBukuId":1,"createAt":"2024-03-29T00:04:47.046Z","updateAt":"2024-03-29T00:04:47.046Z","genreBuku":{"id":1,"nama":"Action","createAt":"2024-03-29T00:04:20.814Z","updateAt":"2024-03-29T00:04:20.814Z"}},{"id":2,"bukuId":1,"genreBukuId":2,"createAt":"2024-03-29T00:04:47.056Z","updateAt":"2024-03-29T00:04:47.056Z","genreBuku":{"id":2,"nama":"Advanture","createAt":"2024-03-29T00:04:26.837Z","updateAt":"2024-03-29T00:04:26.837Z"}},{"id":3,"bukuId":1,"genreBukuId":3,"createAt":"2024-03-29T00:04:47.058Z","updateAt":"2024-03-29T00:04:47.058Z","genreBuku":{"id":3,"nama":"Fantasy","createAt":"2024-03-29T00:04:30.468Z","updateAt":"2024-03-29T00:04:30.468Z"}}]
/// ulasan : [{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-04-19T13:51:18.236Z","updateAt":"2024-04-19T13:51:18.236Z","user":{"UserID":1,"Username":null,"Password":"$2b$10$mhOrLjx5LYjuPhrq0scIJegY.5Z5c5y/qmunHnCQIbrTE2v/vVU1y","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-28T23:14:51.041Z","updateAt":"2024-03-28T23:14:51.041Z"}}]
/// episode : [{"id":1,"BukuID":1,"judul":"Chapter 1","file":null,"createAt":"2024-04-19T13:53:50.345Z","updateAt":"2024-04-19T13:53:50.345Z"}]
/// avgRating : 4

class DataDetailBook {
  DataDetailBook({
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
      this.updateAt, 
      this.kategoryBuku, 
      this.genreBuku, 
      this.ulasan, 
      this.episode, 
      this.avgRating,});

  DataDetailBook.fromJson(dynamic json) {
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
    if (json['kategoryBuku'] != null) {
      kategoryBuku = [];
      json['kategoryBuku'].forEach((v) {
        kategoryBuku?.add(KategoryBukuRelasi.fromJson(v));
      });
    }
    if (json['genreBuku'] != null) {
      genreBuku = [];
      json['genreBuku'].forEach((v) {
        genreBuku?.add(DetailBukuGenreBukuRelasi.fromJson(v));
      });
    }
    if (json['ulasan'] != null) {
      ulasan = [];
      json['ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
    if (json['episode'] != null) {
      episode = [];
      json['episode'].forEach((v) {
        episode?.add(Episode.fromJson(v));
      });
    }
    avgRating = json['avgRating'].toDouble();
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
  List<KategoryBukuRelasi>? kategoryBuku;
  List<DetailBukuGenreBukuRelasi>? genreBuku;
  List<Ulasan>? ulasan;
  List<Episode>? episode;
  double? avgRating;

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
    if (kategoryBuku != null) {
      map['kategoryBuku'] = kategoryBuku?.map((v) => v.toJson()).toList();
    }
    if (genreBuku != null) {
      map['genreBuku'] = genreBuku?.map((v) => v.toJson()).toList();
    }
    if (ulasan != null) {
      map['ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    if (episode != null) {
      map['episode'] = episode?.map((v) => v.toJson()).toList();
    }
    map['avgRating'] = avgRating;
    return map;
  }

}

/// id : 1
/// BukuID : 1
/// judul : "Chapter 1"
/// file : null
/// createAt : "2024-04-19T13:53:50.345Z"
/// updateAt : "2024-04-19T13:53:50.345Z"

class Episode {
  Episode({
      this.id, 
      this.bukuID, 
      this.judul, 
      this.file, 
      this.createAt, 
      this.updateAt,});

  Episode.fromJson(dynamic json) {
    id = json['id'];
    bukuID = json['BukuID'];
    judul = json['judul'];
    file = json['file'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? id;
  int? bukuID;
  String? judul;
  dynamic file;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['BukuID'] = bukuID;
    map['judul'] = judul;
    map['file'] = file;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}

/// UlasanID : 1
/// UserID : 1
/// BukuID : 1
/// Ulasan : "Awesome!"
/// Rating : 4
/// createAt : "2024-04-19T13:51:18.236Z"
/// updateAt : "2024-04-19T13:51:18.236Z"
/// user : {"UserID":1,"Username":null,"Password":"$2b$10$mhOrLjx5LYjuPhrq0scIJegY.5Z5c5y/qmunHnCQIbrTE2v/vVU1y","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-28T23:14:51.041Z","updateAt":"2024-03-28T23:14:51.041Z"}

class Ulasan {
  Ulasan({
      this.ulasanID, 
      this.userID, 
      this.bukuID, 
      this.ulasan, 
      this.rating, 
      this.createAt, 
      this.updateAt, 
      this.user,});

  Ulasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  int? rating;
  String? createAt;
  String? updateAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// UserID : 1
/// Username : null
/// Password : "$2b$10$mhOrLjx5LYjuPhrq0scIJegY.5Z5c5y/qmunHnCQIbrTE2v/vVU1y"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "admin"
/// createAt : "2024-03-28T23:14:51.041Z"
/// updateAt : "2024-03-28T23:14:51.041Z"

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

/// id : 1
/// bukuId : 1
/// genreBukuId : 1
/// createAt : "2024-03-29T00:04:47.046Z"
/// updateAt : "2024-03-29T00:04:47.046Z"
/// genreBuku : {"id":1,"nama":"Action","createAt":"2024-03-29T00:04:20.814Z","updateAt":"2024-03-29T00:04:20.814Z"}

class DetailBukuGenreBukuRelasi {
  DetailBukuGenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  DetailBukuGenreBukuRelasi.fromJson(dynamic json) {
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
/// nama : "Action"
/// createAt : "2024-03-29T00:04:20.814Z"
/// updateAt : "2024-03-29T00:04:20.814Z"

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

/// KategoriBukuID : 1
/// BukuID : 1
/// KategoriID : 1
/// createAt : "2024-03-29T00:04:47.060Z"
/// updateAt : "2024-03-29T00:04:47.060Z"
/// kategoryBuku : {"KategoriID":1,"NamaKategori":"Manhwa","createAt":"2024-03-29T00:04:36.588Z","updateAt":"2024-03-29T00:04:36.588Z"}

class KategoryBukuRelasi {
  KategoryBukuRelasi({
      this.kategoriBukuID, 
      this.bukuID, 
      this.kategoriID, 
      this.createAt, 
      this.updateAt, 
      this.kategoryBuku,});

  KategoryBukuRelasi.fromJson(dynamic json) {
    kategoriBukuID = json['KategoriBukuID'];
    bukuID = json['BukuID'];
    kategoriID = json['KategoriID'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    kategoryBuku = json['kategoryBuku'] != null ? KategoryBuku.fromJson(json['kategoryBuku']) : null;
  }
  int? kategoriBukuID;
  int? bukuID;
  int? kategoriID;
  String? createAt;
  String? updateAt;
  KategoryBuku? kategoryBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriBukuID'] = kategoriBukuID;
    map['BukuID'] = bukuID;
    map['KategoriID'] = kategoriID;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (kategoryBuku != null) {
      map['kategoryBuku'] = kategoryBuku?.toJson();
    }
    return map;
  }

}

/// KategoriID : 1
/// NamaKategori : "Manhwa"
/// createAt : "2024-03-29T00:04:36.588Z"
/// updateAt : "2024-03-29T00:04:36.588Z"

class KategoryBuku {
  KategoryBuku({
      this.kategoriID, 
      this.namaKategori, 
      this.createAt, 
      this.updateAt,});

  KategoryBuku.fromJson(dynamic json) {
    kategoriID = json['KategoriID'];
    namaKategori = json['NamaKategori'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? kategoriID;
  String? namaKategori;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriID'] = kategoriID;
    map['NamaKategori'] = namaKategori;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}