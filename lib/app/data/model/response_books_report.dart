/// status : 200
/// total : 3
/// data : [{"BukuID":2,"Judul":"Solo Leveling","Penulis":"Chugong","Penerbit":"Gemar Baca","TahunTerbit":2018,"deskripsi":"bercerita tentang kemunculan \"Gate\" di berbagai titik di seluruh dunia. Portal misterius tersebut menghubungkan dunia manusia dengan dunia sihir di mana para monster berbahaya muncul. Bersamaan dengan itu, sejumlah manusia berkekuatan super dengan peringkat tertentu berdasarkan jumlah energi sihir dalam tubuh pun bangkit. Dikenal sebagai \"Hunter\", mereka maju di garda terdepan demi memerangi para monster yang mengancam. Solo Leveling berpusat pada karakter Sung Jin-woo, seorang Hunter Rank E yang berjuang keras demi membiayai pengobatan sang ibu. Suatu ketika, terjadi peristiwa tak terduga yang mengubah takdir hidup Jinwoo. Hunter yang dijuluki sebagai yang terlemah tersebut merangkak menjadi Hunter paling menakutkan.","stok":10,"cover":null,"status":"diPinjamkan","createAt":"2024-04-20T00:20:14.016Z","updateAt":"2024-04-21T15:05:59.150Z","ulasan":[{"UlasanID":6,"UserID":1,"BukuID":2,"Ulasan":"Awesome","Rating":4,"createAt":"2024-04-21T10:31:28.465Z","updateAt":"2024-04-21T10:31:28.465Z"},{"UlasanID":8,"UserID":1,"BukuID":2,"Ulasan":"Oke","Rating":3,"createAt":"2024-04-21T10:41:42.062Z","updateAt":"2024-04-21T10:41:42.062Z"}],"peminjaman":[{"PeminjamanID":2,"UserID":1,"BukuID":2,"TanggalPeminjaman":"2024-04-21T15:05:59.033Z","TanggalPengembalian":"2024-04-23T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-04-21T15:05:59.033Z","updateAt":"2024-04-21T15:05:59.033Z"}],"koleksi_pribadi":[{"KoleksiID":2,"UserID":1,"BukuID":2,"createAt":"2024-04-21T15:06:17.751Z","updateAt":"2024-04-21T15:06:17.751Z"}],"averageRating":3.5,"totalBorrowed":1,"totalCollected":1,"penulis":"Chugong","penerbit":"Gemar Baca","judul":"Solo Leveling"}]

class ResponseBooksReport {
  ResponseBooksReport({
      this.status, 
      this.total, 
      this.data,});

  ResponseBooksReport.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBooksReport.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataBooksReport>? data;

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

/// BukuID : 2
/// Judul : "Solo Leveling"
/// Penulis : "Chugong"
/// Penerbit : "Gemar Baca"
/// TahunTerbit : 2018
/// deskripsi : "bercerita tentang kemunculan \"Gate\" di berbagai titik di seluruh dunia. Portal misterius tersebut menghubungkan dunia manusia dengan dunia sihir di mana para monster berbahaya muncul. Bersamaan dengan itu, sejumlah manusia berkekuatan super dengan peringkat tertentu berdasarkan jumlah energi sihir dalam tubuh pun bangkit. Dikenal sebagai \"Hunter\", mereka maju di garda terdepan demi memerangi para monster yang mengancam. Solo Leveling berpusat pada karakter Sung Jin-woo, seorang Hunter Rank E yang berjuang keras demi membiayai pengobatan sang ibu. Suatu ketika, terjadi peristiwa tak terduga yang mengubah takdir hidup Jinwoo. Hunter yang dijuluki sebagai yang terlemah tersebut merangkak menjadi Hunter paling menakutkan."
/// stok : 10
/// cover : null
/// status : "diPinjamkan"
/// createAt : "2024-04-20T00:20:14.016Z"
/// updateAt : "2024-04-21T15:05:59.150Z"
/// ulasan : [{"UlasanID":6,"UserID":1,"BukuID":2,"Ulasan":"Awesome","Rating":4,"createAt":"2024-04-21T10:31:28.465Z","updateAt":"2024-04-21T10:31:28.465Z"},{"UlasanID":8,"UserID":1,"BukuID":2,"Ulasan":"Oke","Rating":3,"createAt":"2024-04-21T10:41:42.062Z","updateAt":"2024-04-21T10:41:42.062Z"}]
/// peminjaman : [{"PeminjamanID":2,"UserID":1,"BukuID":2,"TanggalPeminjaman":"2024-04-21T15:05:59.033Z","TanggalPengembalian":"2024-04-23T00:00:00.000Z","statusPeminjaman":"dipinjam","createAt":"2024-04-21T15:05:59.033Z","updateAt":"2024-04-21T15:05:59.033Z"}]
/// koleksi_pribadi : [{"KoleksiID":2,"UserID":1,"BukuID":2,"createAt":"2024-04-21T15:06:17.751Z","updateAt":"2024-04-21T15:06:17.751Z"}]
/// averageRating : 3.5
/// totalBorrowed : 1
/// totalCollected : 1
/// penulis : "Chugong"
/// penerbit : "Gemar Baca"
/// judul : "Solo Leveling"

class DataBooksReport {
  DataBooksReport({
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
      this.ulasan, 
      this.peminjaman, 
      this.koleksiPribadi, 
      this.averageRating, 
      this.totalBorrowed, 
      this.totalCollected,});

  DataBooksReport.fromJson(dynamic json) {
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
    if (json['ulasan'] != null) {
      ulasan = [];
      json['ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
    if (json['peminjaman'] != null) {
      peminjaman = [];
      json['peminjaman'].forEach((v) {
        peminjaman?.add(Peminjaman.fromJson(v));
      });
    }
    if (json['koleksi_pribadi'] != null) {
      koleksiPribadi = [];
      json['koleksi_pribadi'].forEach((v) {
        koleksiPribadi?.add(KoleksiPribadi.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    totalBorrowed = json['totalBorrowed'];
    totalCollected = json['totalCollected'];
    penulis = json['penulis'];
    penerbit = json['penerbit'];
    judul = json['judul'];
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? deskripsi;
  int? stok;
  dynamic cover;
  String? status;
  String? createAt;
  String? updateAt;
  List<Ulasan>? ulasan;
  List<Peminjaman>? peminjaman;
  List<KoleksiPribadi>? koleksiPribadi;
  double? averageRating;
  int? totalBorrowed;
  int? totalCollected;

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
    if (ulasan != null) {
      map['ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.map((v) => v.toJson()).toList();
    }
    if (koleksiPribadi != null) {
      map['koleksi_pribadi'] = koleksiPribadi?.map((v) => v.toJson()).toList();
    }
    map['averageRating'] = averageRating;
    map['totalBorrowed'] = totalBorrowed;
    map['totalCollected'] = totalCollected;
    map['penulis'] = penulis;
    map['penerbit'] = penerbit;
    map['judul'] = judul;
    return map;
  }

}

/// KoleksiID : 2
/// UserID : 1
/// BukuID : 2
/// createAt : "2024-04-21T15:06:17.751Z"
/// updateAt : "2024-04-21T15:06:17.751Z"

class KoleksiPribadi {
  KoleksiPribadi({
      this.koleksiID, 
      this.userID, 
      this.bukuID, 
      this.createAt, 
      this.updateAt,});

  KoleksiPribadi.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? koleksiID;
  int? userID;
  int? bukuID;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KoleksiID'] = koleksiID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}

/// PeminjamanID : 2
/// UserID : 1
/// BukuID : 2
/// TanggalPeminjaman : "2024-04-21T15:05:59.033Z"
/// TanggalPengembalian : "2024-04-23T00:00:00.000Z"
/// statusPeminjaman : "dipinjam"
/// createAt : "2024-04-21T15:05:59.033Z"
/// updateAt : "2024-04-21T15:05:59.033Z"

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

/// UlasanID : 6
/// UserID : 1
/// BukuID : 2
/// Ulasan : "Awesome"
/// Rating : 4
/// createAt : "2024-04-21T10:31:28.465Z"
/// updateAt : "2024-04-21T10:31:28.465Z"

class Ulasan {
  Ulasan({
      this.ulasanID, 
      this.userID, 
      this.bukuID, 
      this.ulasan, 
      this.rating, 
      this.createAt, 
      this.updateAt,});

  Ulasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  int? rating;
  String? createAt;
  String? updateAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    return map;
  }

}