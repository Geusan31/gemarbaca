/// status : 200
/// message : "Create buku successfull"
/// data : {"BukuID":2,"Judul":"Solo Leveling","Penulis":"raissan","Penerbit":"raissan","TahunTerbit":2024,"deskripsi":null,"stok":5,"cover":null,"status":"belumDipinjam","createAt":"2024-04-17T03:02:04.450Z","updateAt":"2024-04-17T03:02:04.450Z"}

class ResponseCreateBook {
  ResponseCreateBook({
    this.status,
    this.message,
    this.data,
  });

  ResponseCreateBook.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataCreateBook.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataCreateBook? data;

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

/// BukuID : 2
/// Judul : "Solo Leveling"
/// Penulis : "raissan"
/// Penerbit : "raissan"
/// TahunTerbit : 2024
/// deskripsi : null
/// stok : 5
/// cover : null
/// status : "belumDipinjam"
/// createAt : "2024-04-17T03:02:04.450Z"
/// updateAt : "2024-04-17T03:02:04.450Z"

class DataCreateBook {
  DataCreateBook({
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
  });

  DataCreateBook.fromJson(dynamic json) {
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
    return map;
  }
}
