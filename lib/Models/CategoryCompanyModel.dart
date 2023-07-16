/// tcmpcod : "006"
/// tcmpdsc : "ORIENT                        "

class CategoryCompanyModel {
  CategoryCompanyModel({
      String? tcmpcod, 
      String? tcmpdsc,}){
    _tcmpcod = tcmpcod;
    _tcmpdsc = tcmpdsc;
}

  CategoryCompanyModel.fromJson(dynamic json) {
    _tcmpcod = json['tcmpcod'];
    _tcmpdsc = json['tcmpdsc'];
  }
  String? _tcmpcod;
  String? _tcmpdsc;
CategoryCompanyModel copyWith({  String? tcmpcod,
  String? tcmpdsc,
}) => CategoryCompanyModel(  tcmpcod: tcmpcod ?? _tcmpcod,
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