class SalesData {
  SalesData(this.month, this.sales);

  final String month; // اسم الشهر
  final num sales; // قيمة المبيعات
}
class MaintenanceCostsModel {

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

  MaintenanceCostsModel({
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
  }) {
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
  }

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

  factory MaintenanceCostsModel.fromMap(Map<String, dynamic> json) =>
      MaintenanceCostsModel(
        jan: json["1"] ?? 0,
        feb: json["2"] ?? 0,
        mar: json["3"] ?? 0,
        apr: json["4"] ?? 0,
        may: json["5"] ?? 0,
        jun: json["6"] ?? 0,
        jul: json["7"] ?? 0,
        aug: json["8"] ?? 0,
        sep: json["9"] ?? 0,
        oct: json["10"] ?? 0,
        nov: json["11"] ?? 0,
        dec: json["12"] ?? 0,
      );
  List<SalesData> toSalesDataList() {
    return [
      SalesData('Jan', _jan ?? 0),
      SalesData('Feb', _feb ?? 0),
      SalesData('Mar', _mar ?? 0),
      SalesData('Apr', _apr ?? 0),
      SalesData('May', _may ?? 0),
      SalesData('Jun', _jun ?? 0),
      SalesData('Jul', _jul ?? 0),
      SalesData('Aug', _aug ?? 0),
      SalesData('Sep', _sep ?? 0),
      SalesData('Oct', _oct ?? 0),
      SalesData('Nov', _nov ?? 0),
      SalesData('Dec', _dec ?? 0),
    ];
  }
  bool areAllMonthsNull() {
    return _jan == null &&
        _feb == null &&
        _mar == null &&
        _apr == null &&
        _may == null &&
        _jun == null &&
        _jul == null &&
        _aug == null &&
        _sep == null &&
        _oct == null &&
        _nov == null &&
        _dec == null;
  }
}
