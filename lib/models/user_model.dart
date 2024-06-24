class UserModel {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? photo;
  String? password;
  String? role;
  bool? confirm;
  List<dynamic>? roles;
  Null passwordResetToken;
  String? codeclient;
  String? villedenaissance;
  String? codepostaledenaissance;
  String? paysdenaissance;
  String? civilit;
  String? nationnalit;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.photo,
      this.password,
      this.role,
      this.confirm,
      this.roles,
      this.passwordResetToken,
      this.codeclient,
      this.villedenaissance,
      this.codepostaledenaissance,
      this.paysdenaissance,
      this.civilit,
      this.nationnalit});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    password = json['password'];
    role = json['role'];
    confirm = json['confirm'];

    roles = json['roles'];
    passwordResetToken = json['passwordResetToken'];
    codeclient = json['codeclient'];
    villedenaissance = json['villedenaissance'];
    codepostaledenaissance = json['codepostaledenaissance'];
    paysdenaissance = json['paysdenaissance'];
    civilit = json['civilité'];
    nationnalit = json['nationnalité'];
  }
}
