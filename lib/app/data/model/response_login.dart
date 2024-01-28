/// status : 200
/// message : "Login Successfully"
/// data : {"id":2,"name":"Raissan","username":"raissan","email":"raissan@gmail.com","password":"$2b$10$F.t1xkk6h2Sio8YrDdFKReNsJoLpU3p8iKO5wGgnNFMhhNfODEsZW","firebaseUserId":null,"level":"anggota"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzA2MTMzNTQ5LCJleHAiOjE3MDYxMzcxNDl9.GJmkP5iD_u96LWhoTr12lorCC4hrpBeFeQymufX9Z8U"

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data, 
      this.token,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
  int? status;
  String? message;
  Data? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// id : 2
/// name : "Raissan"
/// username : "raissan"
/// email : "raissan@gmail.com"
/// password : "$2b$10$F.t1xkk6h2Sio8YrDdFKReNsJoLpU3p8iKO5wGgnNFMhhNfODEsZW"
/// firebaseUserId : null
/// level : "anggota"

class Data {
  Data({
      this.id, 
      this.name, 
      this.username, 
      this.email, 
      this.password, 
      this.firebaseUserId, 
      this.level,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firebaseUserId = json['firebaseUserId'];
    level = json['level'];
  }
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  dynamic firebaseUserId;
  String? level;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['firebaseUserId'] = firebaseUserId;
    map['level'] = level;
    return map;
  }

}