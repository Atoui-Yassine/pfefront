class AppApi {
  static const String baseUrl = "http://localhost:8085/";
  static const String signupUrl = "${baseUrl}client/create";
  static const String getUserUrl = "${baseUrl}client/findAdminById/";

  static const String loginUrl = "${baseUrl}Auth/signin";
  static const String createFinancementUrl = "${baseUrl}financement/create";
}
