/// tctgcod : "010"
/// tctgdsc : "BUILT IN OVEN                 "

class CompanyCategoryModel {
  CompanyCategoryModel({
      String? tctgcod, 
      String? tctgdsc,}){
    _tctgcod = tctgcod;
    _tctgdsc = tctgdsc;
}

  CompanyCategoryModel.fromJson(dynamic json) {
    _tctgcod = json['tctgcod'];
    _tctgdsc = json['tctgdsc'];
  }
  String? _tctgcod;
  String? _tctgdsc;
CompanyCategoryModel copyWith({  String? tctgcod,
  String? tctgdsc,
}) => CompanyCategoryModel(  tctgcod: tctgcod ?? _tctgcod,
  tctgdsc: tctgdsc ?? _tctgdsc,
);
  String? get tctgcod => _tctgcod;
  String? get tctgdsc => _tctgdsc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tctgcod'] = _tctgcod;
    map['tctgdsc'] = _tctgdsc;
    return map;
  }

}