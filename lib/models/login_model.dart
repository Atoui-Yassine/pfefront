class LoginModel {
  String? token;
  String? type;
  String? refreshToken;
  int? id;
  String? username;
  String? email;
  String? roles;
  String? role;

  LoginModel(
      {this.token,
      this.type,
      this.refreshToken,
      this.id,
      this.username,
      this.email,
      this.roles,
      this.role});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
    refreshToken = json['refreshToken'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    data['refreshToken'] = this.refreshToken;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['role'] = this.role;
    return data;
  }
}
