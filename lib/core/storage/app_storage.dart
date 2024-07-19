import 'package:pfefront/core/storage/storage.dart';

class AppStorage {
  static const keyVerified = "verified";
  static const keyName = "fullName";
  static const keyEmail = "email";
  static const keyId = "id";
  static const keyDate1 = 'idp';
  static const keyDate2 = 'ville';
  static const keyDate3 = 's';
  static const keyDate4 = 'time';

  static const keyMontant1 = "eventid";
  static const keyMontant2 = "situation";

  static const keyMontant3 = "idPre";
  static const keyMontant4 = "date";

  static const keyCat = "categoryy";
  static const keyDate = "categoryy";

  static const String keyToken = "token";
  static const keyNumContrat = "role";
  static saveNumContrat(role) {
    SecureStorage.writeSecureData(key: keyNumContrat, value: role);
  }

  static String? readNumContrat() {
    return SecureStorage.readSecureData(keyNumContrat);
  }

  static saveDate1(si) {
    SecureStorage.writeSecureData(key: keyDate1, value: si);
  }

  static String? readDate1() {
    return SecureStorage.readSecureData(keyDate1);
  }

  static saveDate(si) {
    SecureStorage.writeSecureData(key: keyDate, value: si);
  }

  static String? readDate() {
    return SecureStorage.readSecureData(keyDate);
  }

  static saveDate2(parent) {
    SecureStorage.writeSecureData(key: keyDate2, value: parent);
  }

  static String? readDate2() {
    return SecureStorage.readSecureData(keyDate2);
  }

  static saveDate3(String status) {
    SecureStorage.writeSecureData(key: keyDate3, value: status);
  }

  static String? readDate3() {
    return SecureStorage.readSecureData(keyDate3);
  }

  static saveCat(String cat) {
    SecureStorage.writeSecureData(key: keyCat, value: cat);
  }

  static String? readCat() {
    return SecureStorage.readSecureData(keyCat);
  }

  static saveDate4(time) {
    SecureStorage.writeSecureData(key: keyDate4, value: time);
  }

  static String? readDate4() {
    return SecureStorage.readSecureData(keyDate4);
  }

  static saveToken(String token) {
    SecureStorage.writeSecureData(key: keyToken, value: token);
  }

  static String? readToken() {
    return SecureStorage.readSecureData(keyToken);
  }

  static saveVerified(verified) {
    SecureStorage.writeSecureData(key: keyVerified, value: verified);
  }

  static String? readVerified() {
    return SecureStorage.readSecureData(keyVerified);
  }

  static saveName(fullName) {
    SecureStorage.writeSecureData(key: keyName, value: fullName);
  }

  static String? readName() {
    return SecureStorage.readSecureData(keyName);
  }

  static saveMontant1(idP) {
    SecureStorage.writeSecureData(key: keyMontant1, value: idP);
  }

  static String? readMontant1() {
    return SecureStorage.readSecureData(keyMontant1);
  }

  static saveMontant2(date) {
    SecureStorage.writeSecureData(key: keyMontant2, value: date);
  }

  static String? readMontant2() {
    return SecureStorage.readSecureData(keyMontant2);
  }

  static saveMontant3(idPre) {
    SecureStorage.writeSecureData(key: keyMontant3, value: idPre);
  }

  static String? readMontant3() {
    return SecureStorage.readSecureData(keyMontant3);
  }

  static saveEmail(String email) {
    SecureStorage.writeSecureData(key: keyEmail, value: email);
  }

  static String? readEmail() {
    return SecureStorage.readSecureData(keyEmail);
  }

  static saveId(id) {
    SecureStorage.writeSecureData(key: keyId, value: id);
  }

  static String? readId() {
    return SecureStorage.readSecureData(keyId);
  }

  static saveMontant4(id) {
    SecureStorage.writeSecureData(key: keyMontant4, value: id);
  }

  static String? readMontant4() {
    return SecureStorage.readSecureData(keyMontant4);
  }

  static removeId() {
    SecureStorage.deleteSecureData(keyId);
  }
}
