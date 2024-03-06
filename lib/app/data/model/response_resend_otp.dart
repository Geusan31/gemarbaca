/// status : 200
/// message : "OTP baru telah dikirim ke email anda. Harap verifikasi."
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhaXNhcmlhMzQxQGdtYWlsLmNvbSIsIm90cCI6IjYwODM0MTYiLCJpYXQiOjE3MDk3Mjc5NDgsImV4cCI6MTcwOTgxNDM0OH0.7ulRVxYtZhCEiAUBts3eJ_ez4rtjNKY2Ac6eRT3uPlk"

class ResponseResendOtp {
  ResponseResendOtp({
      this.status, 
      this.message, 
      this.token,});

  ResponseResendOtp.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }
  int? status;
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}