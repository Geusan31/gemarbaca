/// status : 200
/// total : 2
/// data : [{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z","genreBuku":[{"id":3,"bukuId":3,"genreBukuId":1,"createAt":"2024-02-24T07:57:51.554Z","updateAt":"2024-02-24T07:57:51.554Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-02-23T12:56:20.740Z","updateAt":"2024-02-23T12:56:20.740Z"}},{"id":4,"bukuId":3,"genreBukuId":2,"createAt":"2024-02-24T07:57:51.576Z","updateAt":"2024-02-24T07:57:51.576Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-02-23T12:57:13.408Z","updateAt":"2024-02-23T12:57:13.408Z"}}],"ulasan":[]}]

class ResponseBook {
  ResponseBook({
      this.status, 
      this.total, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBook.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataBook>? data;

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
/// genreBuku : [{"id":3,"bukuId":3,"genreBukuId":1,"createAt":"2024-02-24T07:57:51.554Z","updateAt":"2024-02-24T07:57:51.554Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-02-23T12:56:20.740Z","updateAt":"2024-02-23T12:56:20.740Z"}},{"id":4,"bukuId":3,"genreBukuId":2,"createAt":"2024-02-24T07:57:51.576Z","updateAt":"2024-02-24T07:57:51.576Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-02-23T12:57:13.408Z","updateAt":"2024-02-23T12:57:13.408Z"}}]
/// ulasan : []

class DataBook {
  DataBook({
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
    this.avgRating,
  });

  DataBook.fromJson(dynamic json) {
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
        genreBuku?.add(GenreBukuRelasi.fromJson(v));
      });
    }
    ulasan = json['ulasan'];
    avgRating = json['avgRating'];
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
  List<GenreBukuRelasi>? genreBuku;
  dynamic ulasan;
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
    map['ulasan'] = ulasan;
    map['avgRating'] = avgRating;
    return map;
  }
}

/// id : 3
/// bukuId : 3
/// genreBukuId : 1
/// createAt : "2024-02-24T07:57:51.554Z"
/// updateAt : "2024-02-24T07:57:51.554Z"
/// genreBuku : {"id":1,"nama":"Fantasy","createAt":"2024-02-23T12:56:20.740Z","updateAt":"2024-02-23T12:56:20.740Z"}

class GenreBukuRelasi {
  GenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  GenreBukuRelasi.fromJson(dynamic json) {
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
/// createAt : "2024-02-23T12:56:20.740Z"
/// updateAt : "2024-02-23T12:56:20.740Z"

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