/// id : "72747"
/// titmcod : "HCS-1805SC     "
/// titmdsc : "HOMAGE INVERTER AC 1.5T HCS-1805S CRYST "
/// titmsts : "A"
/// tcmpcod : "180"
/// tctgcod : "292"
/// tcapcod : "002"
/// tactrat : null
/// tpurrat : "122000.00"
/// tmanrat : "152000.00"
/// tsalrat : "160000"
/// trtlrat : "179100.00"
/// thlfrat : "0.00"
/// tfixrat : "0.00"
/// tgrprat : "162000.00"
/// tlckrat : null
/// tlstdat : "05-07-2023"
/// tlsttim : "11:29:24  "
/// titmqnt : "15"
/// tcomamt : null

class RateUpdateModel {
  RateUpdateModel({
      String? id, 
      String? titmcod, 
      String? titmdsc, 
      String? titmsts, 
      String? tcmpcod, 
      String? tctgcod, 
      String? tcapcod, 
      dynamic tactrat, 
      String? tpurrat, 
      String? tmanrat, 
      String? tsalrat, 
      String? trtlrat, 
      String? thlfrat, 
      String? tfixrat, 
      String? tgrprat, 
      dynamic tlckrat, 
      String? tlstdat, 
      String? tlsttim, 
      String? titmqnt, 
      dynamic tcomamt,}){
    _id = id;
    _titmcod = titmcod;
    _titmdsc = titmdsc;
    _titmsts = titmsts;
    _tcmpcod = tcmpcod;
    _tctgcod = tctgcod;
    _tcapcod = tcapcod;
    _tactrat = tactrat;
    _tpurrat = tpurrat;
    _tmanrat = tmanrat;
    _tsalrat = tsalrat;
    _trtlrat = trtlrat;
    _thlfrat = thlfrat;
    _tfixrat = tfixrat;
    _tgrprat = tgrprat;
    _tlckrat = tlckrat;
    _tlstdat = tlstdat;
    _tlsttim = tlsttim;
    _titmqnt = titmqnt;
    _tcomamt = tcomamt;
}

  RateUpdateModel.fromJson(dynamic json) {
    _id = json['id'];
    _titmcod = json['titmcod'];
    _titmdsc = json['titmdsc'];
    _titmsts = json['titmsts'];
    _tcmpcod = json['tcmpcod'];
    _tctgcod = json['tctgcod'];
    _tcapcod = json['tcapcod'];
    _tactrat = json['tactrat'];
    _tpurrat = json['tpurrat'];
    _tmanrat = json['tmanrat'];
    _tsalrat = json['tsalrat'];
    _trtlrat = json['trtlrat'];
    _thlfrat = json['thlfrat'];
    _tfixrat = json['tfixrat'];
    _tgrprat = json['tgrprat'];
    _tlckrat = json['tlckrat'];
    _tlstdat = json['tlstdat'];
    _tlsttim = json['tlsttim'];
    _titmqnt = json['titmqnt'];
    _tcomamt = json['tcomamt'];
  }
  String? _id;
  String? _titmcod;
  String? _titmdsc;
  String? _titmsts;
  String? _tcmpcod;
  String? _tctgcod;
  String? _tcapcod;
  dynamic _tactrat;
  String? _tpurrat;
  String? _tmanrat;
  String? _tsalrat;
  String? _trtlrat;
  String? _thlfrat;
  String? _tfixrat;
  String? _tgrprat;
  dynamic _tlckrat;
  String? _tlstdat;
  String? _tlsttim;
  String? _titmqnt;
  dynamic _tcomamt;
RateUpdateModel copyWith({  String? id,
  String? titmcod,
  String? titmdsc,
  String? titmsts,
  String? tcmpcod,
  String? tctgcod,
  String? tcapcod,
  dynamic tactrat,
  String? tpurrat,
  String? tmanrat,
  String? tsalrat,
  String? trtlrat,
  String? thlfrat,
  String? tfixrat,
  String? tgrprat,
  dynamic tlckrat,
  String? tlstdat,
  String? tlsttim,
  String? titmqnt,
  dynamic tcomamt,
}) => RateUpdateModel(  id: id ?? _id,
  titmcod: titmcod ?? _titmcod,
  titmdsc: titmdsc ?? _titmdsc,
  titmsts: titmsts ?? _titmsts,
  tcmpcod: tcmpcod ?? _tcmpcod,
  tctgcod: tctgcod ?? _tctgcod,
  tcapcod: tcapcod ?? _tcapcod,
  tactrat: tactrat ?? _tactrat,
  tpurrat: tpurrat ?? _tpurrat,
  tmanrat: tmanrat ?? _tmanrat,
  tsalrat: tsalrat ?? _tsalrat,
  trtlrat: trtlrat ?? _trtlrat,
  thlfrat: thlfrat ?? _thlfrat,
  tfixrat: tfixrat ?? _tfixrat,
  tgrprat: tgrprat ?? _tgrprat,
  tlckrat: tlckrat ?? _tlckrat,
  tlstdat: tlstdat ?? _tlstdat,
  tlsttim: tlsttim ?? _tlsttim,
  titmqnt: titmqnt ?? _titmqnt,
  tcomamt: tcomamt ?? _tcomamt,
);
  String? get id => _id;
  String? get titmcod => _titmcod;
  String? get titmdsc => _titmdsc;
  String? get titmsts => _titmsts;
  String? get tcmpcod => _tcmpcod;
  String? get tctgcod => _tctgcod;
  String? get tcapcod => _tcapcod;
  dynamic get tactrat => _tactrat;
  String? get tpurrat => _tpurrat;
  String? get tmanrat => _tmanrat;
  String? get tsalrat => _tsalrat;
  String? get trtlrat => _trtlrat;
  String? get thlfrat => _thlfrat;
  String? get tfixrat => _tfixrat;
  String? get tgrprat => _tgrprat;
  dynamic get tlckrat => _tlckrat;
  String? get tlstdat => _tlstdat;
  String? get tlsttim => _tlsttim;
  String? get titmqnt => _titmqnt;
  dynamic get tcomamt => _tcomamt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['titmcod'] = _titmcod;
    map['titmdsc'] = _titmdsc;
    map['titmsts'] = _titmsts;
    map['tcmpcod'] = _tcmpcod;
    map['tctgcod'] = _tctgcod;
    map['tcapcod'] = _tcapcod;
    map['tactrat'] = _tactrat;
    map['tpurrat'] = _tpurrat;
    map['tmanrat'] = _tmanrat;
    map['tsalrat'] = _tsalrat;
    map['trtlrat'] = _trtlrat;
    map['thlfrat'] = _thlfrat;
    map['tfixrat'] = _tfixrat;
    map['tgrprat'] = _tgrprat;
    map['tlckrat'] = _tlckrat;
    map['tlstdat'] = _tlstdat;
    map['tlsttim'] = _tlsttim;
    map['titmqnt'] = _titmqnt;
    map['tcomamt'] = _tcomamt;
    return map;
  }

}