/// status : 200
/// message : "Update episode successfull"
/// data : {"id":8,"BukuID":2,"judul":"Bab 7","file":null,"createAt":"2024-04-21T01:18:27.513Z","updateAt":"2024-04-21T01:44:37.139Z"}

class ResponseEditEpisode {
  ResponseEditEpisode({
      this.status, 
      this.message, 
      this.data,});

  ResponseEditEpisode.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataEditEpisode.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataEditEpisode? data;

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

/// id : 8
/// BukuID : 2
/// judul : "Bab 7"
/// file : null
/// createAt : "2024-04-21T01:18:27.513Z"
/// updateAt : "2024-04-21T01:44:37.139Z"

class DataEditEpisode {
  DataEditEpisode({
      this.id, 
      this.bukuID, 
      this.judul, 
      this.file, 
      this.createAt, 
      this.updateAt,});

  DataEditEpisode.fromJson(dynamic json) {
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