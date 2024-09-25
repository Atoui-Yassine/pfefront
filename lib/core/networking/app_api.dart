class AppApi {
  static const String baseUrl = "http://localhost:8085/";
  //static const String baseUrl = "http://192.168.1.105:8085/";

  static const String signupUrl = "${baseUrl}client/create";
  static const String getUserUrl = "${baseUrl}client/findClientById/";

  static const String loginUrl = "${baseUrl}Auth/signin";
  static const String createFinancementUrl = "${baseUrl}financement/create";
  static const String getImageUrl = "${baseUrl}client/files/";
  static const String updateUserUrl = "${baseUrl}client/update/";
  static const String forgetPasswordUrl = "${baseUrl}Auth/forgetPassword";
  static const String verifyCodePasswordUrl = "${baseUrl}Auth/savePassword/";
  static const String logOutUrl = "${baseUrl}Auth/signout";
  static const String postContratUrl = "${baseUrl}contrat/create";
  static const String getContratUrl = "${baseUrl}contrat/findContratById/";
  static const String startProcess = "${baseUrl}api/process";
  static const String completeTask = "${baseUrl}api/process";
  static const String getTaskDetails = "${baseUrl}api/process";
  static const String killProcessInstance = "${baseUrl}api/process";
  static const String getCurrentTask = "${baseUrl}api/process";
  
}
