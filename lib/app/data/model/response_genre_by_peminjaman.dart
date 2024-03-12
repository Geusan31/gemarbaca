/// status : 200
/// data : [{"genre":"Advanture","count":1},{"genre":"Action","count":1},{"genre":"Fantasy","count":1}]

class ResponseGenreByPeminjaman {
  ResponseGenreByPeminjaman({
      this.status, 
      this.data,});

  ResponseGenreByPeminjaman.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataGenreByPeminjaman.fromJson(v));
      });
    }
  }
  int? status;
  List<DataGenreByPeminjaman>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// genre : "Advanture"
/// count : 1

class DataGenreByPeminjaman {
  DataGenreByPeminjaman({
      this.genre, 
      this.count,});

  DataGenreByPeminjaman.fromJson(dynamic json) {
    genre = json['genre'];
    count = json['count'];
  }
  String? genre;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genre'] = genre;
    map['count'] = count;
    return map;
  }

}