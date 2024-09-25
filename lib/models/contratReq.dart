class ContratReq {
  String? codecontrat;
  String? datedebut;
  String? datefin;

  ContratReq({this.codecontrat, this.datedebut, this.datefin});

  Map<String, dynamic> toJson() {
    return {
      'codecontrat': codecontrat,
      'datedebut': datedebut,
      'datefin': datefin,
    };
  }
}