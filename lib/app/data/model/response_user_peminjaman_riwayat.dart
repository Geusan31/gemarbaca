/// status : 200
/// data : {"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z","peminjaman":[{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]},"historyPeminjam":[{"id":1,"peminjamanId":1,"tanggalPengembalian":"2004-03-20T00:00:00.000Z","createAt":"2024-03-08T22:00:43.887Z","updateAt":"2024-03-08T22:00:43.887Z","peminjaman":{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}}]}]}

class ResponseUserPeminjamanRiwayat {
  ResponseUserPeminjamanRiwayat({
      this.status, 
      this.data,});

  ResponseUserPeminjamanRiwayat.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? DataUserPeminjamanRiwayat.fromJson(json['data']) : null;
  }
  int? status;
  DataUserPeminjamanRiwayat? data;

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
/// peminjaman : [{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]},"historyPeminjam":[{"id":1,"peminjamanId":1,"tanggalPengembalian":"2004-03-20T00:00:00.000Z","createAt":"2024-03-08T22:00:43.887Z","updateAt":"2024-03-08T22:00:43.887Z","peminjaman":{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}}]}]

class DataUserPeminjamanRiwayat {
  DataUserPeminjamanRiwayat({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createAt, 
      this.updateAt, 
      this.peminjaman,});

  DataUserPeminjamanRiwayat.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['role'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    if (json['peminjaman'] != null) {
      peminjaman = [];
      json['peminjaman'].forEach((v) {
        peminjaman?.add(Peminjaman.fromJson(v));
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
  List<Peminjaman>? peminjaman;

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
/// buku : {"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}
/// historyPeminjam : [{"id":1,"peminjamanId":1,"tanggalPengembalian":"2004-03-20T00:00:00.000Z","createAt":"2024-03-08T22:00:43.887Z","updateAt":"2024-03-08T22:00:43.887Z","peminjaman":{"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}}]

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
      this.buku, 
      this.historyPeminjam,});

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
    if (json['historyPeminjam'] != null) {
      historyPeminjam = [];
      json['historyPeminjam'].forEach((v) {
        historyPeminjam?.add(HistoryPeminjam.fromJson(v));
      });
    }
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
  List<HistoryPeminjam>? historyPeminjam;

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
    if (historyPeminjam != null) {
      map['historyPeminjam'] = historyPeminjam?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// peminjamanId : 1
/// tanggalPengembalian : "2004-03-20T00:00:00.000Z"
/// createAt : "2024-03-08T22:00:43.887Z"
/// updateAt : "2024-03-08T22:00:43.887Z"
/// peminjaman : {"PeminjamanID":1,"UserID":2,"BukuID":5,"TanggalPeminjaman":"2024-03-08T21:57:57.888Z","TanggalPengembalian":"2024-03-20T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-03-08T21:57:57.888Z","updateAt":"2024-03-08T21:57:57.888Z","buku":{"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}}

class HistoryPeminjam {
  HistoryPeminjam({
      this.id, 
      this.peminjamanId, 
      this.tanggalPengembalian, 
      this.createAt, 
      this.updateAt, 
      this.peminjaman,});

  HistoryPeminjam.fromJson(dynamic json) {
    id = json['id'];
    peminjamanId = json['peminjamanId'];
    tanggalPengembalian = json['tanggalPengembalian'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    peminjaman = json['peminjaman'] != null ? PeminjamanHistory.fromJson(json['peminjaman']) : null;
  }
  int? id;
  int? peminjamanId;
  String? tanggalPengembalian;
  String? createAt;
  String? updateAt;
  PeminjamanHistory? peminjaman;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['peminjamanId'] = peminjamanId;
    map['tanggalPengembalian'] = tanggalPengembalian;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.toJson();
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
/// buku : {"BukuID":5,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":null,"stok":10,"cover":null,"createAt":"2024-03-08T21:07:51.212Z","updateAt":"2024-03-08T21:07:51.212Z","genreBuku":[{"id":7,"bukuId":5,"genreBukuId":1,"createAt":"2024-03-08T21:07:51.228Z","updateAt":"2024-03-08T21:07:51.228Z","genreBuku":{"id":1,"nama":"Fantasy","createAt":"2024-03-08T20:33:23.103Z","updateAt":"2024-03-08T20:33:23.103Z"}},{"id":8,"bukuId":5,"genreBukuId":2,"createAt":"2024-03-08T21:07:51.230Z","updateAt":"2024-03-08T21:07:51.230Z","genreBuku":{"id":2,"nama":"Action","createAt":"2024-03-08T20:33:27.181Z","updateAt":"2024-03-08T20:33:27.181Z"}},{"id":9,"bukuId":5,"genreBukuId":3,"createAt":"2024-03-08T21:07:51.231Z","updateAt":"2024-03-08T21:07:51.231Z","genreBuku":{"id":3,"nama":"Advanture","createAt":"2024-03-08T20:33:38.761Z","updateAt":"2024-03-08T20:33:38.761Z"}}]}

class PeminjamanHistory {
  PeminjamanHistory({
      this.peminjamanID, 
      this.userID, 
      this.bukuID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.createAt, 
      this.updateAt, 
      this.buku,});

  PeminjamanHistory.fromJson(dynamic json) {
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
        genreBuku?.add(PeminjamanGenreBukuRelasi.fromJson(v));
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
  List<PeminjamanGenreBukuRelasi>? genreBuku;

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

class PeminjamanGenreBukuRelasi {
  PeminjamanGenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  PeminjamanGenreBukuRelasi.fromJson(dynamic json) {
    id = json['id'];
    bukuId = json['bukuId'];
    genreBukuId = json['genreBukuId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    genreBuku = json['genreBuku'] != null ? PeminjamanGenreBuku.fromJson(json['genreBuku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  PeminjamanGenreBuku? genreBuku;

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

class PeminjamanGenreBuku {
  PeminjamanGenreBuku({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt,});

  PeminjamanGenreBuku.fromJson(dynamic json) {
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

class BukuHistory {
  BukuHistory({
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

  BukuHistory.fromJson(dynamic json) {
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
        genreBuku?.add(HistoryGenreBukuRelasi.fromJson(v));
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
  List<HistoryGenreBukuRelasi>? genreBuku;

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

class HistoryGenreBukuRelasi {
  HistoryGenreBukuRelasi({
      this.id, 
      this.bukuId, 
      this.genreBukuId, 
      this.createAt, 
      this.updateAt, 
      this.genreBuku,});

  HistoryGenreBukuRelasi.fromJson(dynamic json) {
    id = json['id'];
    bukuId = json['bukuId'];
    genreBukuId = json['genreBukuId'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    genreBuku = json['genreBuku'] != null ? HistoryGenreBuku.fromJson(json['genreBuku']) : null;
  }
  int? id;
  int? bukuId;
  int? genreBukuId;
  String? createAt;
  String? updateAt;
  HistoryGenreBuku? genreBuku;

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

class HistoryGenreBuku {
  HistoryGenreBuku({
      this.id, 
      this.nama, 
      this.createAt, 
      this.updateAt,});

  HistoryGenreBuku.fromJson(dynamic json) {
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