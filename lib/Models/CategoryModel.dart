/// tctgcod : "005"
/// tctgdsc : "AIR CONDITIONER               "

class CategoryModel {
  CategoryModel({
      String? tctgcod, 
      String? tctgdsc,}){
    _tctgcod = tctgcod;
    _tctgdsc = tctgdsc;
}

  CategoryModel.fromJson(dynamic json) {
    _tctgcod = json['tctgcod'];
    _tctgdsc = json['tctgdsc'];
  }
  String? _tctgcod;
  String? _tctgdsc;
CategoryModel copyWith({  String? tctgcod,
  String? tctgdsc,
}) => CategoryModel(  tctgcod: tctgcod ?? _tctgcod,
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