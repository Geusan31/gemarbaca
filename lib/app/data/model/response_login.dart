/// status : 200
/// message : "Login Successfully"
/// data : {"UserID":2,"Username":null,"Password":"$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty","Email":"raisaria341@gmail.com","NamaLengkap":"Raissan","Alamat":null,"role":"anggota","createAt":"2024-03-07T15:31:04.443Z","updateAt":"2024-03-07T15:31:04.443Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwibmFtZSI6IlJhaXNzYW4iLCJlbWFpbCI6InJhaXNhcmlhMzQxQGdtYWlsLmNvbSIsInJvbGUiOiJhbmdnb3RhIiwiaWF0IjoxNzA5ODI5NjIyLCJleHAiOjE3MDk5MTYwMjJ9.CXTrmww1oaZOQIHP-a1MFpbajg3WngrGVlbwn_FGlAs"
/// role : "anggota"

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data, 
      this.token, 
      this.role,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
    token = json['token'];
    role = json['role'];
  }
  int? status;
  String? message;
  DataLogin? data;
  String? token;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['role'] = role;
    return map;
  }

}

/// UserID : 2
/// Username : null
/// Password : "$2b$10$pvjj4M3OdFlTuV/ymoK49OadzHMco3Z9QLTTQCV8xXup6hx3Tf6Ty"
/// Email : "raisaria341@gmail.com"
/// NamaLengkap : "Raissan"
/// Alamat : null
/// role : "anggota"
/// createAt : "2024-03-07T15:31:04.443Z"
/// updateAt : "2024-03-07T15:31:04.443Z"

class DataLogin {
  DataLogin({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createAt, 
      this.updateAt,});

  DataLogin.fromJson(dynamic json) {
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