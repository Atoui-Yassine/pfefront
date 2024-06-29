class AppApi {
  static const String baseUrl = "http://localhost:8085/";
  static const String signupUrl = "${baseUrl}client/create";
  static const String getUserUrl = "${baseUrl}client/findClientById/";

  static const String loginUrl = "${baseUrl}Auth/signin";
  static const String createFinancementUrl = "${baseUrl}financement/create";
  static const String getImageUrl = "${baseUrl}client/files/";
  static const String updateUserUrl = "${baseUrl}client/update/";
  static const String forgetPasswordUrl = "${baseUrl}Auth/forgetPassword";
  static const String verifyCodePasswordUrl = "${baseUrl}Auth/savePassword/";
}
