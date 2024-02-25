class EndPoint {
  // static const String BaseUrlApi = "https://gemarbaca-api.onrender.com/";
  static const String BaseUrlApi = "http://127.0.0.1:3000/";

  // Authentication
  static const String login = "${BaseUrlApi}auth/login";
  static const String register = "${BaseUrlApi}auth/register";
  static const String verifyOtp = "${BaseUrlApi}auth/verifyOtp";

  // Book Url
  static const String book = "${BaseUrlApi}book";
  static const String populerBook = "$book/populer";

  // Riwayat Url
static const String riwayat = "${BaseUrlApi}history";
}