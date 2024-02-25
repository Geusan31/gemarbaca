/// status : 200
/// data : [{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z","peminjaman":[{"PeminjamanID":1,"UserID":1,"BukuID":3,"TanggalPeminjaman":"2024-02-25T06:06:13.815Z","TanggalPengembalian":"2024-02-10T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-02-25T06:06:13.815Z","updateAt":"2024-02-25T06:06:13.815Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}}]}]

class ResponsePopulerBook {
  ResponsePopulerBook({
      this.status, 
      this.data,});

  ResponsePopulerBook.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPopulerBook.fromJson(v));
      });
    }
  }
  int? status;
  List<DataPopulerBook>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
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
/// peminjaman : [{"PeminjamanID":1,"UserID":1,"BukuID":3,"TanggalPeminjaman":"2024-02-25T06:06:13.815Z","TanggalPengembalian":"2024-02-10T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-02-25T06:06:13.815Z","updateAt":"2024-02-25T06:06:13.815Z","buku":{"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}}]

class DataPopulerBook {
  DataPopulerBook({
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
      this.peminjaman,});

  DataPopulerBook.fromJson(dynamic json) {
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
    if (json['peminjaman'] != null) {
      peminjaman = [];
      json['peminjaman'].forEach((v) {
        peminjaman?.add(Peminjaman.fromJson(v));
      });
    }
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
  List<Peminjaman>? peminjaman;

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
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// PeminjamanID : 1
/// UserID : 1
/// BukuID : 3
/// TanggalPeminjaman : "2024-02-25T06:06:13.815Z"
/// TanggalPengembalian : "2024-02-10T00:00:00.000Z"
/// statusPeminjaman : "dipinjam"
/// createAt : "2024-02-25T06:06:13.815Z"
/// updateAt : "2024-02-25T06:06:13.815Z"
/// buku : {"BukuID":3,"Judul":"Strike Wak!","Penulis":"Rido","Penerbit":"Pamit","TahunTerbit":2024,"deskripsi":"Kesedihan Rido Pamit tiktok","stok":10,"cover":null,"createAt":"2024-02-24T07:57:51.447Z","updateAt":"2024-02-24T07:57:51.447Z"}

class Peminjaman {
  Peminjaman({
      this.peminjamanID, 
      this.userID, 
      this.bukuID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  Peminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    tanggalPeminjaman = json['TanggalPeminjaman'];
    tanggalPengembalian = json['TanggalPengembalian'];
    statusPeminjaman = json['statusPeminjaman'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    buku = json['buku'] != null ? Buku.fromJson(json['buku']) : null;
  }
  int? peminjamanID;
  int? userID;
  int? bukuID;
  String? tanggalPeminjaman;
  String? tanggalPengembalian;
  String? statusPeminjaman;
  String? createAt;
  String? updateAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['TanggalPeminjaman'] = tanggalPeminjaman;
    map['TanggalPengembalian'] = tanggalPengembalian;
    map['statusPeminjaman'] = statusPeminjaman;
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