/// status : 200
/// message : "Registration Successfully"
/// data : {"id":4,"name":"Rais","username":"rais","email":"rais@gmail.com","password":"$2b$10$epvh4O3o03RSn96mC4uMiO7lxm0yu8HNstFJI/EXCtRzc68p6yq72","firebaseUserId":null,"level":"anggota"}

class ResponseRegister {
  ResponseRegister({
      this.status, 
      this.message, 
      this.data,});

  ResponseRegister.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Data? data;

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

/// id : 4
/// name : "Rais"
/// username : "rais"
/// email : "rais@gmail.com"
/// password : "$2b$10$epvh4O3o03RSn96mC4uMiO7lxm0yu8HNstFJI/EXCtRzc68p6yq72"
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