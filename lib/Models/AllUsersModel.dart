/// id : "1"
/// tusrid : "saif"
/// tusrpwd : "2222"
/// tusrnam : "Saif ur Rehman "
/// tmobnum : "03217555020"
/// temladd : "saif@gmail.com"
/// tcrtdat : "2023-05-01"
/// tcrttim : null
/// tupdat : "2023-05-16"
/// tusrsts : "Yes"
/// tusrtyp : "Admin"
/// tempcod : ""
/// tloccod : ""
/// tempimei : "SP1A.210812.016"

class AllUsersModel {
  AllUsersModel({
      String? id, 
      String? tusrid, 
      String? tusrpwd, 
      String? tusrnam, 
      String? tmobnum, 
      String? temladd, 
      String? tcrtdat, 
      dynamic tcrttim, 
      String? tupdat, 
      String? tusrsts, 
      String? tusrtyp, 
      String? tempcod, 
      String? tloccod, 
      String? tempimei,}){
    _id = id;
    _tusrid = tusrid;
    _tusrpwd = tusrpwd;
    _tusrnam = tusrnam;
    _tmobnum = tmobnum;
    _temladd = temladd;
    _tcrtdat = tcrtdat;
    _tcrttim = tcrttim;
    _tupdat = tupdat;
    _tusrsts = tusrsts;
    _tusrtyp = tusrtyp;
    _tempcod = tempcod;
    _tloccod = tloccod;
    _tempimei = tempimei;
}

  AllUsersModel.fromJson(dynamic json) {
    _id = json['id'];
    _tusrid = json['tusrid'];
    _tusrpwd = json['tusrpwd'];
    _tusrnam = json['tusrnam'];
    _tmobnum = json['tmobnum'];
    _temladd = json['temladd'];
    _tcrtdat = json['tcrtdat'];
    _tcrttim = json['tcrttim'];
    _tupdat = json['tupdat'];
    _tusrsts = json['tusrsts'];
    _tusrtyp = json['tusrtyp'];
    _tempcod = json['tempcod'];
    _tloccod = json['tloccod'];
    _tempimei = json['tempimei'];
  }
  String? _id;
  String? _tusrid;
  String? _tusrpwd;
  String? _tusrnam;
  String? _tmobnum;
  String? _temladd;
  String? _tcrtdat;
  dynamic _tcrttim;
  String? _tupdat;
  String? _tusrsts;
  String? _tusrtyp;
  String? _tempcod;
  String? _tloccod;
  String? _tempimei;
AllUsersModel copyWith({  String? id,
  String? tusrid,
  String? tusrpwd,
  String? tusrnam,
  String? tmobnum,
  String? temladd,
  String? tcrtdat,
  dynamic tcrttim,
  String? tupdat,
  String? tusrsts,
  String? tusrtyp,
  String? tempcod,
  String? tloccod,
  String? tempimei,
}) => AllUsersModel(  id: id ?? _id,
  tusrid: tusrid ?? _tusrid,
  tusrpwd: tusrpwd ?? _tusrpwd,
  tusrnam: tusrnam ?? _tusrnam,
  tmobnum: tmobnum ?? _tmobnum,
  temladd: temladd ?? _temladd,
  tcrtdat: tcrtdat ?? _tcrtdat,
  tcrttim: tcrttim ?? _tcrttim,
  tupdat: tupdat ?? _tupdat,
  tusrsts: tusrsts ?? _tusrsts,
  tusrtyp: tusrtyp ?? _tusrtyp,
  tempcod: tempcod ?? _tempcod,
  tloccod: tloccod ?? _tloccod,
  tempimei: tempimei ?? _tempimei,
);
  String? get id => _id;
  String? get tusrid => _tusrid;
  String? get tusrpwd => _tusrpwd;
  String? get tusrnam => _tusrnam;
  String? get tmobnum => _tmobnum;
  String? get temladd => _temladd;
  String? get tcrtdat => _tcrtdat;
  dynamic get tcrttim => _tcrttim;
  String? get tupdat => _tupdat;
  String? get tusrsts => _tusrsts;
  String? get tusrtyp => _tusrtyp;
  String? get tempcod => _tempcod;
  String? get tloccod => _tloccod;
  String? get tempimei => _tempimei;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tusrid'] = _tusrid;
    map['tusrpwd'] = _tusrpwd;
    map['tusrnam'] = _tusrnam;
    map['tmobnum'] = _tmobnum;
    map['temladd'] = _temladd;
    map['tcrtdat'] = _tcrtdat;
    map['tcrttim'] = _tcrttim;
    map['tupdat'] = _tupdat;
    map['tusrsts'] = _tusrsts;
    map['tusrtyp'] = _tusrtyp;
    map['tempcod'] = _tempcod;
    map['tloccod'] = _tloccod;
    map['tempimei'] = _tempimei;
    return map;
  }

}