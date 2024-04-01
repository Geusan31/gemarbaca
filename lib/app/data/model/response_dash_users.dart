/// status : 200
/// total : 3
/// data : [{"UserID":1,"NamaLengkap":"Raissan","Username":null,"Email":"raisaria341@gmail.com","Alamat":null,"role":"admin"},{"UserID":2,"NamaLengkap":"NoName","Username":null,"Email":"namagakpunya325@gmail.com","Alamat":null,"role":"anggota"},{"UserID":3,"NamaLengkap":"Volly","Username":null,"Email":"tryvolly9@gmail.com","Alamat":null,"role":"anggota"}]

class ResponseDashUsers {
  ResponseDashUsers({
      this.status, 
      this.total, 
      this.data,});

  ResponseDashUsers.fromJson(dynamic json) {
    status = json['status'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDashUsers.fromJson(v));
      });
    }
  }
  int? status;
  int? total;
  List<DataDashUsers>? data;

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

/// UserID : 1
/// NamaLengkap : "Raissan"
/// Username : null
/// Email : "raisaria341@gmail.com"
/// Alamat : null
/// role : "admin"

class DataDashUsers {
  DataDashUsers({
      this.userID, 
      this.namaLengkap, 
      this.username, 
      this.email, 
      this.alamat, 
      this.role,});

  DataDashUsers.fromJson(dynamic json) {
    userID = json['UserID'];
    namaLengkap = json['NamaLengkap'];
    username = json['Username'];
    email = json['Email'];
    alamat = json['Alamat'];
    role = json['role'];
  }
  int? userID;
  String? namaLengkap;
  dynamic username;
  String? email;
  dynamic alamat;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['NamaLengkap'] = namaLengkap;
    map['Username'] = username;
    map['Email'] = email;
    map['Alamat'] = alamat;
    map['role'] = role;
    return map;
  }

}