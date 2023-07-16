/// error : 800
/// message : "Item Already Add In Cart"

class AddToCartModel {
  AddToCartModel({
      num? error, 
      String? message,}){
    _error = error;
    _message = message;
}

  AddToCartModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
  }
  num? _error;
  String? _message;
AddToCartModel copyWith({  num? error,
  String? message,
}) => AddToCartModel(  error: error ?? _error,
  message: message ?? _message,
);
  num? get error => _error;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    return map;
  }

}