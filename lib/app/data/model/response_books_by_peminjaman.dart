/// status : 200
/// data : [{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}],"peminjaman":[{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z"}]}]

class ResponseBooksByPeminjaman {
  ResponseBooksByPeminjaman({
      this.status, 
      this.data,});

  ResponseBooksByPeminjaman.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBookByPeminjaman.fromJson(v));
      });
    }
  }
  int? status;
  List<DataBookByPeminjaman>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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
/// peminjaman : [{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z"}]

class DataBookByPeminjaman {
  DataBookByPeminjaman({
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
      this.peminjaman,});

  DataBookByPeminjaman.fromJson(dynamic json) {
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
        genreBuku?.add(BookByPeminjamanGenreBukuRelasi.fromJson(v));
      });
    }
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
  dynamic deskripsi;
  int? stok;
  dynamic cover;
  String? createAt;
  String? updateAt;
  List<BookByPeminjamanGenreBukuRelasi>? genreBuku;
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
    if (genreBuku != null) {
      map['genreBuku'] = genreBuku?.map((v) => v.toJson()).toList();
    }
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// PeminjamanID : 1
/// UserID : 2
/// BukuID : 5
/// TanggalPeminjaman : "2024-03-08T21:57:57.888Z"
/// TanggalPengembalian : "2024-03-20T00:00:00.000Z"
/// statusPeminjaman : "dipinjam"
/// createAt : "2024-03-08T21:57:57.888Z"
/// updateAt : "2024-03-08T21:57:57.888Z"

class Peminjaman {
  Peminjaman({
      this.peminjamanID, 
      this.userID, 
      this.bukuID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.createAt, 
      this.updateAt,});

  Peminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    tanggalPeminjaman = json['TanggalPeminjaman'];
    tanggalPengembalian = json['TanggalPengembalian'];
    statusPeminjaman = json['statusPeminjaman'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? peminjamanID;
  int? userID;
  int? bukuID;
  String? tanggalPeminjaman;
  String? tanggalPengembalian;
  String? statusPeminjaman;
  String? createAt;
  String? updateAt;

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
    return map;
  }

}

/// id : 7
/// bukuId : 5
/// genreBukuId : 1
/// createAt : "2024-03-08T21:07:51.228Z"
/// updateAt : "2024-03-08T21:07:51.228Z"
/// genreBuku : {"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}

class BookByPeminjamanGenreBukuRelasi {
  BookByPeminjamanGenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  BookByPeminjamanGenreBukuRelasi.fromJson(dynamic json) {
    id = json['id'];
    bukuId = json['bukuId'];
    genreBukuId = json['genreBukuId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    genreBuku = json['genreBuku'] != null ? BookByPeminjamanGenreBuku.fromJson(json['genreBuku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  BookByPeminjamanGenreBuku? genreBuku;

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

class BookByPeminjamanGenreBuku {
  BookByPeminjamanGenreBuku({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt,});

  BookByPeminjamanGenreBuku.fromJson(dynamic json) {
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