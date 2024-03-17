/// status : 200
/// message : "Create peminjaman successful"
/// data : {"peminjaman":{"PeminjamanID":9,"UserID":1,"BukuID":1,"TanggalPeminjaman":"2024-03-16T04:50:51.277Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-16T04:50:51.277Z","updateAt":"2024-03-16T04:50:51.277Z","buku":{"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"file":null,"status":"belumDipinjam","createAt":"2024-03-14T12:16:32.396Z","updateAt":"2024-03-16T04:46:55.430Z"}},"history":{"id":9,"peminjamanId":9,"tanggalPengembalian":"2024-03-20T00:00:00.000Z","createAt":"2024-03-16T04:50:51.362Z","updateAt":"2024-03-16T04:50:51.362Z"}}

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataPeminjaman.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataPeminjaman? data;

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

/// peminjaman : {"PeminjamanID":9,"UserID":1,"BukuID":1,"TanggalPeminjaman":"2024-03-16T04:50:51.277Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-16T04:50:51.277Z","updateAt":"2024-03-16T04:50:51.277Z","buku":{"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"file":null,"status":"belumDipinjam","createAt":"2024-03-14T12:16:32.396Z","updateAt":"2024-03-16T04:46:55.430Z"}}
/// history : {"id":9,"peminjamanId":9,"tanggalPengembalian":"2024-03-20T00:00:00.000Z","createAt":"2024-03-16T04:50:51.362Z","updateAt":"2024-03-16T04:50:51.362Z"}

class DataPeminjaman {
  DataPeminjaman({
      this.peminjaman, 
      this.history,});

  DataPeminjaman.fromJson(dynamic json) {
    peminjaman = json['peminjaman'] != null ? Peminjaman.fromJson(json['peminjaman']) : null;
    history = json['history'] != null ? History.fromJson(json['history']) : null;
  }
  Peminjaman? peminjaman;
  History? history;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.toJson();
    }
    if (history != null) {
      map['history'] = history?.toJson();
    }
    return map;
  }

}

/// id : 9
/// peminjamanId : 9
/// tanggalPengembalian : "2024-03-20T00:00:00.000Z"
/// createAt : "2024-03-16T04:50:51.362Z"
/// updateAt : "2024-03-16T04:50:51.362Z"

class History {
  History({
      this.id, 
      this.peminjamanId, 
      this.tanggalPengembalian, 
      this.createAt, 
      this.updateAt,});

  History.fromJson(dynamic json) {
    id = json['id'];
    peminjamanId = json['peminjamanId'];
    tanggalPengembalian = json['tanggalPengembalian'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? id;
  int? peminjamanId;
  String? tanggalPengembalian;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['peminjamanId'] = peminjamanId;
    map['tanggalPengembalian'] = tanggalPengembalian;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}

/// PeminjamanID : 9
/// UserID : 1
/// BukuID : 1
/// TanggalPeminjaman : "2024-03-16T04:50:51.277Z"
/// TanggalPengembalian : "2024-03-20T00:00:00.000Z"
/// statusPeminjaman : "dipinjam"
/// createAt : "2024-03-16T04:50:51.277Z"
/// updateAt : "2024-03-16T04:50:51.277Z"
/// buku : {"BukuID":1,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"file":null,"status":"belumDipinjam","createAt":"2024-03-14T12:16:32.396Z","updateAt":"2024-03-16T04:46:55.430Z"}

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
/// updateAt : "2024-03-16T04:46:55.430Z"

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