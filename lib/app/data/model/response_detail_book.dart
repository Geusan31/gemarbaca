/// message : 200
/// data : {"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}],"ulasan":[{"UlasanID":2,"UserID":2,"BukuID":5,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-03-12T03:11:50.129Z","updateAt":"2024-03-12T03:11:50.129Z","user":{"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z"}}],"avgRating":4}

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
/// ulasan : [{"UlasanID":2,"UserID":2,"BukuID":5,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-03-12T03:11:50.129Z","updateAt":"2024-03-12T03:11:50.129Z","user":{"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z"}}]
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
      this.createAt, 
      this.updateAt, 
      this.genreBuku, 
      this.ulasan, 
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
    createAt = json['createAt'];
    updateAt = json['updateAt'];
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
    avgRating = json['avgRating'];
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
  List<DetailBukuGenreBukuRelasi>? genreBuku;
  List<Ulasan>? ulasan;
  int? avgRating;

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
    if (ulasan != null) {
      map['ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    map['avgRating'] = avgRating;
    return map;
  }

}

/// UlasanID : 2
/// UserID : 2
/// BukuID : 5
/// Ulasan : "Awesome!"
/// Rating : 4
/// createAt : "2024-03-12T03:11:50.129Z"
/// updateAt : "2024-03-12T03:11:50.129Z"
/// user : {"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z"}

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

/// UserID : 2
/// Username : null
/// Password : "$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "admin"
/// createAt : "2024-03-07T15:31:04.443Z"
/// updateAt : "2024-03-07T15:31:04.443Z"

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

/// id : 7
/// bukuId : 5
/// genreBukuId : 1
/// createAt : "2024-03-08T21:07:51.228Z"
/// updateAt : "2024-03-08T21:07:51.228Z"
/// genreBuku : {"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}

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
    genreBuku = json['genreBuku'] != null ? DetailBukuGenreBuku.fromJson(json['genreBuku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  DetailBukuGenreBuku? genreBuku;

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

class DetailBukuGenreBuku {
  DetailBukuGenreBuku({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt,});

  DetailBukuGenreBuku.fromJson(dynamic json) {
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