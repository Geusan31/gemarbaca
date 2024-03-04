class EndPoint {
  // static const String BaseUrlApi = "https://gemarbaca-api.onrender.com/";
  static const String BaseUrlApi = "http://192.168.1.10:3000/";

  // Authentication
  static const String login = "${BaseUrlApi}auth/login";
  static const String register = "${BaseUrlApi}auth/register";
  static const String verifyOtp = "${BaseUrlApi}auth/verifyOtp";

  // Validate Token
  static const String validate = "${BaseUrlApi}validate";

  // Book Url
  static const String book = "${BaseUrlApi}book";
  static const String populerBook = "$book/populer";
  static const String highRateBook = "$book/high-rate";

  // Genre Url
  static const String genre = "${BaseUrlApi}genre";

  // Kategori Url
  static const String kategori = "${BaseUrlApi}kategory";

  // Riwayat Url
  static const String riwayat = "${BaseUrlApi}history";
}
