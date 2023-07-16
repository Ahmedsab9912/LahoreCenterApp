/// Total Balance : 5136020
/// Receivable Bal : 5136020
/// Total Collection : 0
/// Total Customer : 223
/// Receivable Customer : 223
/// Collected Customer : 0
/// Nil Customer : 223
/// Close Customer : 0
/// Expiry Account : 53
/// Receivable Amount : 852950
/// Day-1 : "Sunday"
/// Customer-1 : 0
/// Amount-1 : 0
/// Day-2 : "Saturday"
/// Customer-2 : 0
/// Amount-2 : 0
/// Day-3 : "Friday"
/// Customer-3 : 0
/// Amount-3 : 0
/// Day-4 : "Thursday"
/// Customer-4 : 0
/// Amount-4 : 0
/// Jan-Col : 787420
/// Feb-Col : 749100
/// Mar-Col : 887400
/// Apr-Col : 817300
/// May-Col : 932300
/// Jun-Col : 989950
/// Jul-Col : 445900
/// Aug-Col : 534800
/// Sep-Col : 527250
/// Oct-Col : 569300
/// Nov-Col : 648850
/// Dec-Col : 680200
/// Jan-Ins : 635600
/// Feb-Ins : 658050
/// Mar-Ins : 712450
/// Apr-Ins : 684950
/// May-Ins : 763400
/// Jun-Ins : 835400
/// Jul-Ins : 392200
/// Aug-Ins : 444250
/// Sep-Ins : 445850
/// Oct-Ins : 485300
/// Nov-Ins : 552300
/// Dec-Ins : 581750
/// Jan-Count : 190
/// Feb-Count : 188
/// Mar-Count : 198
/// Apr-Count : 183
/// May-Count : 209
/// Jun-Count : 231
/// Jul-Count : 123
/// Aug-Count : 137
/// Sep-Count : 134
/// Oct-Count : 146
/// Nov-Count : 168
/// Dec-Count : 168
/// Jan-% : 124
/// Feb-% : 114
/// Mar-% : 125
/// Apr-% : 119
/// May-% : 122
/// Jun-% : 119
/// Jul-% : 114
/// Aug-% : 120
/// Sep-% : 118
/// Oct-% : 117
/// Nov-% : 117
/// Dec-% : 117
/// Last Date : null
/// Last Time : null

class CollectorModel {
  CollectorModel({
      num? totalBalance, 
      num? receivableBal, 
      num? totalCollection, 
      num? totalCustomer, 
      num? receivableCustomer, 
      num? collectedCustomer, 
      num? nilCustomer, 
      num? closeCustomer, 
      num? expiryAccount, 
      num? receivableAmount, 
      String? day1, 
      num? customer1, 
      num? amount1, 
      String? day2, 
      num? customer2, 
      num? amount2, 
      String? day3, 
      num? customer3, 
      num? amount3, 
      String? day4, 
      num? customer4, 
      num? amount4, 
      num? janCol, 
      num? febCol, 
      num? marCol, 
      num? aprCol, 
      num? mayCol, 
      num? junCol, 
      num? julCol, 
      num? augCol, 
      num? sepCol, 
      num? octCol, 
      num? novCol, 
      num? decCol, 
      num? janIns, 
      num? febIns, 
      num? marIns, 
      num? aprIns, 
      num? mayIns, 
      num? junIns, 
      num? julIns, 
      num? augIns, 
      num? sepIns, 
      num? octIns, 
      num? novIns, 
      num? decIns, 
      num? janCount, 
      num? febCount, 
      num? marCount, 
      num? aprCount, 
      num? mayCount, 
      num? junCount, 
      num? julCount, 
      num? augCount, 
      num? sepCount, 
      num? octCount, 
      num? novCount, 
      num? decCount, 
      num? jan, 
      num? feb, 
      num? mar, 
      num? apr, 
      num? may, 
      num? jun, 
      num? jul, 
      num? aug, 
      num? sep, 
      num? oct, 
      num? nov, 
      num? dec, 
      dynamic lastDate, 
      dynamic lastTime,}){
    _totalBalance = totalBalance;
    _receivableBal = receivableBal;
    _totalCollection = totalCollection;
    _totalCustomer = totalCustomer;
    _receivableCustomer = receivableCustomer;
    _collectedCustomer = collectedCustomer;
    _nilCustomer = nilCustomer;
    _closeCustomer = closeCustomer;
    _expiryAccount = expiryAccount;
    _receivableAmount = receivableAmount;
    _day1 = day1;
    _customer1 = customer1;
    _amount1 = amount1;
    _day2 = day2;
    _customer2 = customer2;
    _amount2 = amount2;
    _day3 = day3;
    _customer3 = customer3;
    _amount3 = amount3;
    _day4 = day4;
    _customer4 = customer4;
    _amount4 = amount4;
    _janCol = janCol;
    _febCol = febCol;
    _marCol = marCol;
    _aprCol = aprCol;
    _mayCol = mayCol;
    _junCol = junCol;
    _julCol = julCol;
    _augCol = augCol;
    _sepCol = sepCol;
    _octCol = octCol;
    _novCol = novCol;
    _decCol = decCol;
    _janIns = janIns;
    _febIns = febIns;
    _marIns = marIns;
    _aprIns = aprIns;
    _mayIns = mayIns;
    _junIns = junIns;
    _julIns = julIns;
    _augIns = augIns;
    _sepIns = sepIns;
    _octIns = octIns;
    _novIns = novIns;
    _decIns = decIns;
    _janCount = janCount;
    _febCount = febCount;
    _marCount = marCount;
    _aprCount = aprCount;
    _mayCount = mayCount;
    _junCount = junCount;
    _julCount = julCount;
    _augCount = augCount;
    _sepCount = sepCount;
    _octCount = octCount;
    _novCount = novCount;
    _decCount = decCount;
    _jan = jan;
    _feb = feb;
    _mar = mar;
    _apr = apr;
    _may = may;
    _jun = jun;
    _jul = jul;
    _aug = aug;
    _sep = sep;
    _oct = oct;
    _nov = nov;
    _dec = dec;
    _lastDate = lastDate;
    _lastTime = lastTime;
}

  CollectorModel.fromJson(dynamic json) {
    _totalBalance = json['Total Balance'];
    _receivableBal = json['Receivable Bal'];
    _totalCollection = json['Total Collection'];
    _totalCustomer = json['Total Customer'];
    _receivableCustomer = json['Receivable Customer'];
    _collectedCustomer = json['Collected Customer'];
    _nilCustomer = json['Nil Customer'];
    _closeCustomer = json['Close Customer'];
    _expiryAccount = json['Expiry Account'];
    _receivableAmount = json['Receivable Amount'];
    _day1 = json['Day-1'];
    _customer1 = json['Customer-1'];
    _amount1 = json['Amount-1'];
    _day2 = json['Day-2'];
    _customer2 = json['Customer-2'];
    _amount2 = json['Amount-2'];
    _day3 = json['Day-3'];
    _customer3 = json['Customer-3'];
    _amount3 = json['Amount-3'];
    _day4 = json['Day-4'];
    _customer4 = json['Customer-4'];
    _amount4 = json['Amount-4'];
    _janCol = json['Jan-Col'];
    _febCol = json['Feb-Col'];
    _marCol = json['Mar-Col'];
    _aprCol = json['Apr-Col'];
    _mayCol = json['May-Col'];
    _junCol = json['Jun-Col'];
    _julCol = json['Jul-Col'];
    _augCol = json['Aug-Col'];
    _sepCol = json['Sep-Col'];
    _octCol = json['Oct-Col'];
    _novCol = json['Nov-Col'];
    _decCol = json['Dec-Col'];
    _janIns = json['Jan-Ins'];
    _febIns = json['Feb-Ins'];
    _marIns = json['Mar-Ins'];
    _aprIns = json['Apr-Ins'];
    _mayIns = json['May-Ins'];
    _junIns = json['Jun-Ins'];
    _julIns = json['Jul-Ins'];
    _augIns = json['Aug-Ins'];
    _sepIns = json['Sep-Ins'];
    _octIns = json['Oct-Ins'];
    _novIns = json['Nov-Ins'];
    _decIns = json['Dec-Ins'];
    _janCount = json['Jan-Count'];
    _febCount = json['Feb-Count'];
    _marCount = json['Mar-Count'];
    _aprCount = json['Apr-Count'];
    _mayCount = json['May-Count'];
    _junCount = json['Jun-Count'];
    _julCount = json['Jul-Count'];
    _augCount = json['Aug-Count'];
    _sepCount = json['Sep-Count'];
    _octCount = json['Oct-Count'];
    _novCount = json['Nov-Count'];
    _decCount = json['Dec-Count'];
    _jan = json['Jan-%'];
    _feb = json['Feb-%'];
    _mar = json['Mar-%'];
    _apr = json['Apr-%'];
    _may = json['May-%'];
    _jun = json['Jun-%'];
    _jul = json['Jul-%'];
    _aug = json['Aug-%'];
    _sep = json['Sep-%'];
    _oct = json['Oct-%'];
    _nov = json['Nov-%'];
    _dec = json['Dec-%'];
    _lastDate = json['Last Date'];
    _lastTime = json['Last Time'];
  }
  num? _totalBalance;
  num? _receivableBal;
  num? _totalCollection;
  num? _totalCustomer;
  num? _receivableCustomer;
  num? _collectedCustomer;
  num? _nilCustomer;
  num? _closeCustomer;
  num? _expiryAccount;
  num? _receivableAmount;
  String? _day1;
  num? _customer1;
  num? _amount1;
  String? _day2;
  num? _customer2;
  num? _amount2;
  String? _day3;
  num? _customer3;
  num? _amount3;
  String? _day4;
  num? _customer4;
  num? _amount4;
  num? _janCol;
  num? _febCol;
  num? _marCol;
  num? _aprCol;
  num? _mayCol;
  num? _junCol;
  num? _julCol;
  num? _augCol;
  num? _sepCol;
  num? _octCol;
  num? _novCol;
  num? _decCol;
  num? _janIns;
  num? _febIns;
  num? _marIns;
  num? _aprIns;
  num? _mayIns;
  num? _junIns;
  num? _julIns;
  num? _augIns;
  num? _sepIns;
  num? _octIns;
  num? _novIns;
  num? _decIns;
  num? _janCount;
  num? _febCount;
  num? _marCount;
  num? _aprCount;
  num? _mayCount;
  num? _junCount;
  num? _julCount;
  num? _augCount;
  num? _sepCount;
  num? _octCount;
  num? _novCount;
  num? _decCount;
  num? _jan;
  num? _feb;
  num? _mar;
  num? _apr;
  num? _may;
  num? _jun;
  num? _jul;
  num? _aug;
  num? _sep;
  num? _oct;
  num? _nov;
  num? _dec;
  dynamic _lastDate;
  dynamic _lastTime;
CollectorModel copyWith({  num? totalBalance,
  num? receivableBal,
  num? totalCollection,
  num? totalCustomer,
  num? receivableCustomer,
  num? collectedCustomer,
  num? nilCustomer,
  num? closeCustomer,
  num? expiryAccount,
  num? receivableAmount,
  String? day1,
  num? customer1,
  num? amount1,
  String? day2,
  num? customer2,
  num? amount2,
  String? day3,
  num? customer3,
  num? amount3,
  String? day4,
  num? customer4,
  num? amount4,
  num? janCol,
  num? febCol,
  num? marCol,
  num? aprCol,
  num? mayCol,
  num? junCol,
  num? julCol,
  num? augCol,
  num? sepCol,
  num? octCol,
  num? novCol,
  num? decCol,
  num? janIns,
  num? febIns,
  num? marIns,
  num? aprIns,
  num? mayIns,
  num? junIns,
  num? julIns,
  num? augIns,
  num? sepIns,
  num? octIns,
  num? novIns,
  num? decIns,
  num? janCount,
  num? febCount,
  num? marCount,
  num? aprCount,
  num? mayCount,
  num? junCount,
  num? julCount,
  num? augCount,
  num? sepCount,
  num? octCount,
  num? novCount,
  num? decCount,
  num? jan,
  num? feb,
  num? mar,
  num? apr,
  num? may,
  num? jun,
  num? jul,
  num? aug,
  num? sep,
  num? oct,
  num? nov,
  num? dec,
  dynamic lastDate,
  dynamic lastTime,
}) => CollectorModel(  totalBalance: totalBalance ?? _totalBalance,
  receivableBal: receivableBal ?? _receivableBal,
  totalCollection: totalCollection ?? _totalCollection,
  totalCustomer: totalCustomer ?? _totalCustomer,
  receivableCustomer: receivableCustomer ?? _receivableCustomer,
  collectedCustomer: collectedCustomer ?? _collectedCustomer,
  nilCustomer: nilCustomer ?? _nilCustomer,
  closeCustomer: closeCustomer ?? _closeCustomer,
  expiryAccount: expiryAccount ?? _expiryAccount,
  receivableAmount: receivableAmount ?? _receivableAmount,
  day1: day1 ?? _day1,
  customer1: customer1 ?? _customer1,
  amount1: amount1 ?? _amount1,
  day2: day2 ?? _day2,
  customer2: customer2 ?? _customer2,
  amount2: amount2 ?? _amount2,
  day3: day3 ?? _day3,
  customer3: customer3 ?? _customer3,
  amount3: amount3 ?? _amount3,
  day4: day4 ?? _day4,
  customer4: customer4 ?? _customer4,
  amount4: amount4 ?? _amount4,
  janCol: janCol ?? _janCol,
  febCol: febCol ?? _febCol,
  marCol: marCol ?? _marCol,
  aprCol: aprCol ?? _aprCol,
  mayCol: mayCol ?? _mayCol,
  junCol: junCol ?? _junCol,
  julCol: julCol ?? _julCol,
  augCol: augCol ?? _augCol,
  sepCol: sepCol ?? _sepCol,
  octCol: octCol ?? _octCol,
  novCol: novCol ?? _novCol,
  decCol: decCol ?? _decCol,
  janIns: janIns ?? _janIns,
  febIns: febIns ?? _febIns,
  marIns: marIns ?? _marIns,
  aprIns: aprIns ?? _aprIns,
  mayIns: mayIns ?? _mayIns,
  junIns: junIns ?? _junIns,
  julIns: julIns ?? _julIns,
  augIns: augIns ?? _augIns,
  sepIns: sepIns ?? _sepIns,
  octIns: octIns ?? _octIns,
  novIns: novIns ?? _novIns,
  decIns: decIns ?? _decIns,
  janCount: janCount ?? _janCount,
  febCount: febCount ?? _febCount,
  marCount: marCount ?? _marCount,
  aprCount: aprCount ?? _aprCount,
  mayCount: mayCount ?? _mayCount,
  junCount: junCount ?? _junCount,
  julCount: julCount ?? _julCount,
  augCount: augCount ?? _augCount,
  sepCount: sepCount ?? _sepCount,
  octCount: octCount ?? _octCount,
  novCount: novCount ?? _novCount,
  decCount: decCount ?? _decCount,
  jan: jan ?? _jan,
  feb: feb ?? _feb,
  mar: mar ?? _mar,
  apr: apr ?? _apr,
  may: may ?? _may,
  jun: jun ?? _jun,
  jul: jul ?? _jul,
  aug: aug ?? _aug,
  sep: sep ?? _sep,
  oct: oct ?? _oct,
  nov: nov ?? _nov,
  dec: dec ?? _dec,
  lastDate: lastDate ?? _lastDate,
  lastTime: lastTime ?? _lastTime,
);
  num? get totalBalance => _totalBalance;
  num? get receivableBal => _receivableBal;
  num? get totalCollection => _totalCollection;
  num? get totalCustomer => _totalCustomer;
  num? get receivableCustomer => _receivableCustomer;
  num? get collectedCustomer => _collectedCustomer;
  num? get nilCustomer => _nilCustomer;
  num? get closeCustomer => _closeCustomer;
  num? get expiryAccount => _expiryAccount;
  num? get receivableAmount => _receivableAmount;
  String? get day1 => _day1;
  num? get customer1 => _customer1;
  num? get amount1 => _amount1;
  String? get day2 => _day2;
  num? get customer2 => _customer2;
  num? get amount2 => _amount2;
  String? get day3 => _day3;
  num? get customer3 => _customer3;
  num? get amount3 => _amount3;
  String? get day4 => _day4;
  num? get customer4 => _customer4;
  num? get amount4 => _amount4;
  num? get janCol => _janCol;
  num? get febCol => _febCol;
  num? get marCol => _marCol;
  num? get aprCol => _aprCol;
  num? get mayCol => _mayCol;
  num? get junCol => _junCol;
  num? get julCol => _julCol;
  num? get augCol => _augCol;
  num? get sepCol => _sepCol;
  num? get octCol => _octCol;
  num? get novCol => _novCol;
  num? get decCol => _decCol;
  num? get janIns => _janIns;
  num? get febIns => _febIns;
  num? get marIns => _marIns;
  num? get aprIns => _aprIns;
  num? get mayIns => _mayIns;
  num? get junIns => _junIns;
  num? get julIns => _julIns;
  num? get augIns => _augIns;
  num? get sepIns => _sepIns;
  num? get octIns => _octIns;
  num? get novIns => _novIns;
  num? get decIns => _decIns;
  num? get janCount => _janCount;
  num? get febCount => _febCount;
  num? get marCount => _marCount;
  num? get aprCount => _aprCount;
  num? get mayCount => _mayCount;
  num? get junCount => _junCount;
  num? get julCount => _julCount;
  num? get augCount => _augCount;
  num? get sepCount => _sepCount;
  num? get octCount => _octCount;
  num? get novCount => _novCount;
  num? get decCount => _decCount;
  num? get jan => _jan;
  num? get feb => _feb;
  num? get mar => _mar;
  num? get apr => _apr;
  num? get may => _may;
  num? get jun => _jun;
  num? get jul => _jul;
  num? get aug => _aug;
  num? get sep => _sep;
  num? get oct => _oct;
  num? get nov => _nov;
  num? get dec => _dec;
  dynamic get lastDate => _lastDate;
  dynamic get lastTime => _lastTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Total Balance'] = _totalBalance;
    map['Receivable Bal'] = _receivableBal;
    map['Total Collection'] = _totalCollection;
    map['Total Customer'] = _totalCustomer;
    map['Receivable Customer'] = _receivableCustomer;
    map['Collected Customer'] = _collectedCustomer;
    map['Nil Customer'] = _nilCustomer;
    map['Close Customer'] = _closeCustomer;
    map['Expiry Account'] = _expiryAccount;
    map['Receivable Amount'] = _receivableAmount;
    map['Day-1'] = _day1;
    map['Customer-1'] = _customer1;
    map['Amount-1'] = _amount1;
    map['Day-2'] = _day2;
    map['Customer-2'] = _customer2;
    map['Amount-2'] = _amount2;
    map['Day-3'] = _day3;
    map['Customer-3'] = _customer3;
    map['Amount-3'] = _amount3;
    map['Day-4'] = _day4;
    map['Customer-4'] = _customer4;
    map['Amount-4'] = _amount4;
    map['Jan-Col'] = _janCol;
    map['Feb-Col'] = _febCol;
    map['Mar-Col'] = _marCol;
    map['Apr-Col'] = _aprCol;
    map['May-Col'] = _mayCol;
    map['Jun-Col'] = _junCol;
    map['Jul-Col'] = _julCol;
    map['Aug-Col'] = _augCol;
    map['Sep-Col'] = _sepCol;
    map['Oct-Col'] = _octCol;
    map['Nov-Col'] = _novCol;
    map['Dec-Col'] = _decCol;
    map['Jan-Ins'] = _janIns;
    map['Feb-Ins'] = _febIns;
    map['Mar-Ins'] = _marIns;
    map['Apr-Ins'] = _aprIns;
    map['May-Ins'] = _mayIns;
    map['Jun-Ins'] = _junIns;
    map['Jul-Ins'] = _julIns;
    map['Aug-Ins'] = _augIns;
    map['Sep-Ins'] = _sepIns;
    map['Oct-Ins'] = _octIns;
    map['Nov-Ins'] = _novIns;
    map['Dec-Ins'] = _decIns;
    map['Jan-Count'] = _janCount;
    map['Feb-Count'] = _febCount;
    map['Mar-Count'] = _marCount;
    map['Apr-Count'] = _aprCount;
    map['May-Count'] = _mayCount;
    map['Jun-Count'] = _junCount;
    map['Jul-Count'] = _julCount;
    map['Aug-Count'] = _augCount;
    map['Sep-Count'] = _sepCount;
    map['Oct-Count'] = _octCount;
    map['Nov-Count'] = _novCount;
    map['Dec-Count'] = _decCount;
    map['Jan-%'] = _jan;
    map['Feb-%'] = _feb;
    map['Mar-%'] = _mar;
    map['Apr-%'] = _apr;
    map['May-%'] = _may;
    map['Jun-%'] = _jun;
    map['Jul-%'] = _jul;
    map['Aug-%'] = _aug;
    map['Sep-%'] = _sep;
    map['Oct-%'] = _oct;
    map['Nov-%'] = _nov;
    map['Dec-%'] = _dec;
    map['Last Date'] = _lastDate;
    map['Last Time'] = _lastTime;
    return map;
  }

}