/// status : 200
/// data : {"id":1,"userId":1,"tanggal_lahir":null,"bio":null,"fotoProfile":null,"jenisKelamin":"other","createAt":"2024-03-25T00:41:17.895Z","updateAt":"2024-03-25T00:41:17.895Z","user":{"UserID":1,"Username":null,"Password":"$2b$10$2/OaEJLcYgk2j87Yj.HOquSnAaGAh1k1AbbMi8mXLDbr6dXH7IxCm","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-25T00:41:17.878Z","updateAt":"2024-03-25T00:41:17.878Z"}}

class ResponseDetailProfile {
  ResponseDetailProfile({
    this.status,
    this.data,
  });

  ResponseDetailProfile.fromJson(dynamic json) {
    status = json['status'];
    data =
        json['data'] != null ? DataDetailProfile.fromJson(json['data']) : null;
  }
  int? status;
  DataDetailProfile? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// id : 1
/// userId : 1
/// tanggal_lahir : null
/// bio : null
/// fotoProfile : null
/// jenisKelamin : "other"
/// createAt : "2024-03-25T00:41:17.895Z"
/// updateAt : "2024-03-25T00:41:17.895Z"
/// user : {"UserID":1,"Username":null,"Password":"$2b$10$2/OaEJLcYgk2j87Yj.HOquSnAaGAh1k1AbbMi8mXLDbr6dXH7IxCm","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"admin","createAt":"2024-03-25T00:41:17.878Z","updateAt":"2024-03-25T00:41:17.878Z"}

class DataDetailProfile {
  DataDetailProfile({
    this.id,
    this.userId,
    this.tanggalLahir,
    this.bio,
    this.fotoProfile,
    this.jenisKelamin,
    this.createAt,
    this.updateAt,
    this.user,
  });

  DataDetailProfile.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    tanggalLahir = json['tanggal_lahir'];
    bio = json['bio'];
    fotoProfile = json['fotoProfile'];
    jenisKelamin = json['jenisKelamin'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  int? userId;
  dynamic tanggalLahir;
  dynamic bio;
  dynamic fotoProfile;
  String? jenisKelamin;
  String? createAt;
  String? updateAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['tanggal_lahir'] = tanggalLahir;
    map['bio'] = bio;
    map['fotoProfile'] = fotoProfile;
    map['jenisKelamin'] = jenisKelamin;
    map['createAt'] = createAt;
    map['updateAt'] = updateAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

/// UserID : 1
/// Username : null
/// Password : "$2b$10$2/OaEJLcYgk2j87Yj.HOquSnAaGAh1k1AbbMi8mXLDbr6dXH7IxCm"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "admin"
/// createAt : "2024-03-25T00:41:17.878Z"
/// updateAt : "2024-03-25T00:41:17.878Z"

class User {
  User({
    this.userID,
    this.username,
    this.password,
    this.email,
    this.namaLengkap,
    this.alamat,
    this.role,
    this.createAt,
    this.updateAt,
  });

  User.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['role'];
    createAt = json['createAt'];
    updateAt = json['updateAt'];
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
    return map;
  }
}
