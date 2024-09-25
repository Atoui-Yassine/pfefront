class ContratModel {
  int? id;
  String? codecontrat;
  String? datedebut;
  String? datefin;
  Clientmap? clientmap;
  Clientmap? clientModel;
  String? piecejustfs;
  String? pieceidentites;
  String? conditiongenerales;

  ContratModel(
      {this.id,
      this.codecontrat,
      this.datedebut,
      this.datefin,
      this.clientmap,
      this.clientModel,
      this.piecejustfs,
      this.pieceidentites,
      this.conditiongenerales});

  ContratModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codecontrat = json['codecontrat'];
    datedebut = json['datedebut'];
    datefin = json['datefin'];
    clientmap = json['clientmap'] != null
        ? Clientmap.fromJson(json['clientmap'])
        : null;
    clientModel = json['clientModel'] != null
        ? Clientmap.fromJson(json['clientModel'])
        : null;
    piecejustfs = json['piecejustfs'];
    pieceidentites = json['pieceidentites'];
    conditiongenerales = json['conditiongenerales'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['codecontrat'] = codecontrat;
    data['datedebut'] = datedebut;
    data['datefin'] = datefin;
    if (clientmap != null) {
      data['clientmap'] = clientmap!.toJson();
    }
    if (clientModel != null) {
      data['clientModel'] = clientModel!.toJson();
    }
    data['piecejustfs'] = piecejustfs;
    data['pieceidentites'] = pieceidentites;
    data['conditiongenerales'] = conditiongenerales;
    return data;
  }
}

class Clientmap {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? photo;
  String? password;
  String? role;
  bool? confirm;
  List<dynamic>? roles;
  String? passwordResetToken;
  int? codeclient;
  String? villedenaissance;
  String? codepostaledenaissance;
  String? paysdenaissance;
  String? civilit;
  String? nationnalit;

  Clientmap(
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

  Clientmap.fromJson(Map<String, dynamic> json) {
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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['photo'] = photo;
    data['password'] = password;
    data['role'] = role;
    data['confirm'] = confirm;
    data['roles'] = roles;
    data['passwordResetToken'] = passwordResetToken;
    data['codeclient'] = codeclient;
    data['villedenaissance'] = villedenaissance;
    data['codepostaledenaissance'] = codepostaledenaissance;
    data['paysdenaissance'] = paysdenaissance;
    
    return data;
  }
}
