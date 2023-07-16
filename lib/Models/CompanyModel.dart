/// tcmpcod : "217"
/// tcmpdsc : "AFTAB STEBLIZERS              "

class CompanyModel {
  CompanyModel({
      String? tcmpcod, 
      String? tcmpdsc,}){
    _tcmpcod = tcmpcod;
    _tcmpdsc = tcmpdsc;
}

  CompanyModel.fromJson(dynamic json) {
    _tcmpcod = json['tcmpcod'];
    _tcmpdsc = json['tcmpdsc'];
  }
  String? _tcmpcod;
  String? _tcmpdsc;
CompanyModel copyWith({  String? tcmpcod,
  String? tcmpdsc,
}) => CompanyModel(  tcmpcod: tcmpcod ?? _tcmpcod,
  tcmpdsc: tcmpdsc ?? _tcmpdsc,
);
  String? get tcmpcod => _tcmpcod;
  String? get tcmpdsc => _tcmpdsc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tcmpcod'] = _tcmpcod;
    map['tcmpdsc'] = _tcmpdsc;
    return map;
  }

}