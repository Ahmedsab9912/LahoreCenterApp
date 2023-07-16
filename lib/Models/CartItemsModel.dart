/// CartItems : [{"id":"14","tordid":"16","torddat":"2023-07-12","titmdsc":"AGERNAL 32\" HD READY 32-801 A           ","titmqnt":"1","tsalrat":"28000","tsalamt":"28000","tempcod":"222"},{"id":"15","tordid":"16","torddat":"2023-07-12","titmdsc":"AGERNAL 32\" SMART ANDROID 32U801A       ","titmqnt":"1","tsalrat":"38000","tsalamt":"38000","tempcod":"222"},{"id":"16","tordid":"16","torddat":"2023-07-12","titmdsc":"ALLIED AIR COOLER ARC 2                 ","titmqnt":"1","tsalrat":"19000","tsalamt":"19000","tempcod":"222"},{"id":"17","tordid":"16","torddat":"2023-07-12","titmdsc":"A-GENERAL INVERTER 1.5 TON FANTASY 18K  ","titmqnt":"1","tsalrat":"150000","tsalamt":"150000","tempcod":"222"},{"id":"18","tordid":"16","torddat":"2023-07-12","titmdsc":"A-GENERAL INVERTER 1.5 TON MAGIC 18K    ","titmqnt":"1","tsalrat":"155000","tsalamt":"155000","tempcod":"222"},{"id":"19","tordid":"16","torddat":"2023-07-12","titmdsc":"DAWLANCE BUILT IN OVEN DUAL SILVER      ","titmqnt":"0","tsalrat":"88000","tsalamt":"0","tempcod":"222"}]
/// tamt : 390000
/// totalItem : 5

class CartItemsModel {
  CartItemsModel({
      List<CartItems>? cartItems, 
      num? tamt, 
      num? totalItem,}){
    _cartItems = cartItems;
    _tamt = tamt;
    _totalItem = totalItem;
}

  CartItemsModel.fromJson(dynamic json) {
    if (json['CartItems'] != null) {
      _cartItems = [];
      json['CartItems'].forEach((v) {
        _cartItems?.add(CartItems.fromJson(v));
      });
    }
    _tamt = json['tamt'];
    _totalItem = json['totalItem'];
  }
  List<CartItems>? _cartItems;
  num? _tamt;
  num? _totalItem;
CartItemsModel copyWith({  List<CartItems>? cartItems,
  num? tamt,
  num? totalItem,
}) => CartItemsModel(  cartItems: cartItems ?? _cartItems,
  tamt: tamt ?? _tamt,
  totalItem: totalItem ?? _totalItem,
);
  List<CartItems>? get cartItems => _cartItems;
  num? get tamt => _tamt;
  num? get totalItem => _totalItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cartItems != null) {
      map['CartItems'] = _cartItems?.map((v) => v.toJson()).toList();
    }
    map['tamt'] = _tamt;
    map['totalItem'] = _totalItem;
    return map;
  }

}

/// id : "14"
/// tordid : "16"
/// torddat : "2023-07-12"
/// titmdsc : "AGERNAL 32\" HD READY 32-801 A           "
/// titmqnt : "1"
/// tsalrat : "28000"
/// tsalamt : "28000"
/// tempcod : "222"

class CartItems {
  CartItems({
      String? id, 
      String? tordid, 
      String? torddat, 
      String? titmdsc, 
      String? titmqnt, 
      String? tsalrat, 
      String? tsalamt, 
      String? tempcod,}){
    _id = id;
    _tordid = tordid;
    _torddat = torddat;
    _titmdsc = titmdsc;
    _titmqnt = titmqnt;
    _tsalrat = tsalrat;
    _tsalamt = tsalamt;
    _tempcod = tempcod;
}

  CartItems.fromJson(dynamic json) {
    _id = json['id'];
    _tordid = json['tordid'];
    _torddat = json['torddat'];
    _titmdsc = json['titmdsc'];
    _titmqnt = json['titmqnt'];
    _tsalrat = json['tsalrat'];
    _tsalamt = json['tsalamt'];
    _tempcod = json['tempcod'];
  }
  String? _id;
  String? _tordid;
  String? _torddat;
  String? _titmdsc;
  String? _titmqnt;
  String? _tsalrat;
  String? _tsalamt;
  String? _tempcod;
CartItems copyWith({  String? id,
  String? tordid,
  String? torddat,
  String? titmdsc,
  String? titmqnt,
  String? tsalrat,
  String? tsalamt,
  String? tempcod,
}) => CartItems(  id: id ?? _id,
  tordid: tordid ?? _tordid,
  torddat: torddat ?? _torddat,
  titmdsc: titmdsc ?? _titmdsc,
  titmqnt: titmqnt ?? _titmqnt,
  tsalrat: tsalrat ?? _tsalrat,
  tsalamt: tsalamt ?? _tsalamt,
  tempcod: tempcod ?? _tempcod,
);
  String? get id => _id;
  String? get tordid => _tordid;
  String? get torddat => _torddat;
  String? get titmdsc => _titmdsc;
  String? get titmqnt => _titmqnt;
  String? get tsalrat => _tsalrat;
  String? get tsalamt => _tsalamt;
  String? get tempcod => _tempcod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tordid'] = _tordid;
    map['torddat'] = _torddat;
    map['titmdsc'] = _titmdsc;
    map['titmqnt'] = _titmqnt;
    map['tsalrat'] = _tsalrat;
    map['tsalamt'] = _tsalamt;
    map['tempcod'] = _tempcod;
    return map;
  }

}