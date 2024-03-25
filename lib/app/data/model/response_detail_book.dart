/// message : 200
/// data : {"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"status":"belumDipinjam","createAt":"2024-03-22T09:21:27.936Z","updateAt":"2024-03-22T09:21:27.936Z","genreBuku":[{"id":1,"bukuId":1,"genreBukuId":1,"createAt":"2024-03-22T09:21:27.983Z","updateAt":"2024-03-22T09:21:27.983Z","genreBuku":{"id":1,"nama":"Action","createAt":"2024-03-22T09:20:45.322Z","updateAt":"2024-03-22T09:20:45.322Z"}},{"id":2,"bukuId":1,"genreBukuId":2,"createAt":"2024-03-22T09:21:28.002Z","updateAt":"2024-03-22T09:21:28.002Z","genreBuku":{"id":2,"nama":"Advanture","createAt":"2024-03-22T09:20:48.881Z","updateAt":"2024-03-22T09:20:48.881Z"}},{"id":3,"bukuId":1,"genreBukuId":3,"createAt":"2024-03-22T09:21:28.004Z","updateAt":"2024-03-22T09:21:28.004Z","genreBuku":{"id":3,"nama":"Fantasy","createAt":"2024-03-22T09:20:52.449Z","updateAt":"2024-03-22T09:20:52.449Z"}}],"ulasan":[{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-03-24T06:03:35.484Z","updateAt":"2024-03-24T06:03:35.484Z","user":{"UserID":1,"Username":null,"Password":"$2b$10$Yx0Nah4zUQGjlrMgf4wLteEFYeUKuuKuaRHV96KNJLUkcAr3CtIjG","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-23T03:30:34.317Z","updateAt":"2024-03-23T03:30:34.317Z"}}],"episode":[{"id":1,"BukuID":1,"judul":"Chapter 1","file":null,"createAt":"2024-03-22T09:25:02.252Z","updateAt":"2024-03-22T09:25:02.252Z"}],"avgRating":null}

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
/// status : "belumDipinjam"
/// createAt : "2024-03-22T09:21:27.936Z"
/// updateAt : "2024-03-22T09:21:27.936Z"
/// genreBuku : [{"id":1,"bukuId":1,"genreBukuId":1,"createAt":"2024-03-22T09:21:27.983Z","updateAt":"2024-03-22T09:21:27.983Z","genreBuku":{"id":1,"nama":"Action","createAt":"2024-03-22T09:20:45.322Z","updateAt":"2024-03-22T09:20:45.322Z"}},{"id":2,"bukuId":1,"genreBukuId":2,"createAt":"2024-03-22T09:21:28.002Z","updateAt":"2024-03-22T09:21:28.002Z","genreBuku":{"id":2,"nama":"Advanture","createAt":"2024-03-22T09:20:48.881Z","updateAt":"2024-03-22T09:20:48.881Z"}},{"id":3,"bukuId":1,"genreBukuId":3,"createAt":"2024-03-22T09:21:28.004Z","updateAt":"2024-03-22T09:21:28.004Z","genreBuku":{"id":3,"nama":"Fantasy","createAt":"2024-03-22T09:20:52.449Z","updateAt":"2024-03-22T09:20:52.449Z"}}]
/// ulasan : [{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Awesome!","Rating":4,"createAt":"2024-03-24T06:03:35.484Z","updateAt":"2024-03-24T06:03:35.484Z","user":{"UserID":1,"Username":null,"Password":"$2b$10$Yx0Nah4zUQGjlrMgf4wLteEFYeUKuuKuaRHV96KNJLUkcAr3CtIjG","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-23T03:30:34.317Z","updateAt":"2024-03-23T03:30:34.317Z"}}]
/// episode : [{"id":1,"BukuID":1,"judul":"Chapter 1","file":null,"createAt":"2024-03-22T09:25:02.252Z","updateAt":"2024-03-22T09:25:02.252Z"}]
/// avgRating : null

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
  String? status;
  String? createAt;
  String? updateAt;
  List<DetailBukuGenreBukuRelasi>? genreBuku;
  List<Ulasan>? ulasan;
  List<Episode>? episode;
  dynamic avgRating;

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
/// createAt : "2024-03-22T09:25:02.252Z"
/// updateAt : "2024-03-22T09:25:02.252Z"

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
/// createAt : "2024-03-24T06:03:35.484Z"
/// updateAt : "2024-03-24T06:03:35.484Z"
/// user : {"UserID":1,"Username":null,"Password":"$2b$10$Yx0Nah4zUQGjlrMgf4wLteEFYeUKuuKuaRHV96KNJLUkcAr3CtIjG","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-23T03:30:34.317Z","updateAt":"2024-03-23T03:30:34.317Z"}

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
/// Password : "$2b$10$Yx0Nah4zUQGjlrMgf4wLteEFYeUKuuKuaRHV96KNJLUkcAr3CtIjG"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "admin"
/// createAt : "2024-03-23T03:30:34.317Z"
/// updateAt : "2024-03-23T03:30:34.317Z"

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
/// createAt : "2024-03-22T09:21:27.983Z"
/// updateAt : "2024-03-22T09:21:27.983Z"
/// genreBuku : {"id":1,"nama":"Action","createAt":"2024-03-22T09:20:45.322Z","updateAt":"2024-03-22T09:20:45.322Z"}

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
/// nama : "Action"
/// createAt : "2024-03-22T09:20:45.322Z"
/// updateAt : "2024-03-22T09:20:45.322Z"

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