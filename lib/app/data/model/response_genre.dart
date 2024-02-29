/// status : 200
/// total : 2
/// data : [{"id":1,"nama":"Fantasy","createAt":"2024-02-23T12:56:20.740Z","updateAt":"2024-02-23T12:56:20.740Z","buku":[{"id":3,"bukuId":3,"genreBukuId":1,"createAt":"2024-02-24T07:57:51.554Z","updateAt":"2024-02-24T07:57:51.554Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}},{"id":15,"bukuId":9,"genreBukuId":1,"createAt":"2024-02-24T10:35:24.611Z","updateAt":"2024-02-24T10:35:24.611Z","buku":{"BukuID":9,"Judul":"Matematika","Penulis":"Rais","Penerbit":"Raissan","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T10:35:24.572Z","updateAt":"2024-02-24T10:35:24.572Z"}}]}]

class ResponseGenre {
  ResponseGenre({
      this.status, 
      this.total, 
      this.data,});

  ResponseGenre.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataGenre.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataGenre>? data;

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

/// id : 1
/// nama : "Fantasy"
/// createAt : "2024-02-23T12:56:20.740Z"
/// updateAt : "2024-02-23T12:56:20.740Z"
/// buku : [{"id":3,"bukuId":3,"genreBukuId":1,"createAt":"2024-02-24T07:57:51.554Z","updateAt":"2024-02-24T07:57:51.554Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}},{"id":15,"bukuId":9,"genreBukuId":1,"createAt":"2024-02-24T10:35:24.611Z","updateAt":"2024-02-24T10:35:24.611Z","buku":{"BukuID":9,"Judul":"Matematika","Penulis":"Rais","Penerbit":"Raissan","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T10:35:24.572Z","updateAt":"2024-02-24T10:35:24.572Z"}}]

class DataGenre {
  DataGenre({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  DataGenre.fromJson(dynamic json) {
    id = json['id'];
    nama = json['nama'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    if (json['buku'] != null) {
      buku = [];
      json['buku'].forEach((v) {
        buku?.add(GenreBukuRelasi.fromJson(v));
      });
    }
  }
  int? id;
  String? nama;
  String? createAt;
  String? updateAt;
  List<GenreBukuRelasi>? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (buku != null) {
      map['buku'] = buku?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// bukuId : 3
/// genreBukuId : 1
/// createAt : "2024-02-24T07:57:51.554Z"
/// updateAt : "2024-02-24T07:57:51.554Z"
/// buku : {"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}

class GenreBukuRelasi {
  GenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  GenreBukuRelasi.fromJson(dynamic json) {
    id = json['id'];
    bukuId = json['bukuId'];
    genreBukuId = json['genreBukuId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['bukuId'] = bukuId;
    map['genreBukuId'] = genreBukuId;
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