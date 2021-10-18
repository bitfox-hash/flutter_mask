class Store {
  String? _code;
  String? _name;
  String? _addr;
  String? _type;
  double? _lat;
  double? _lng;
  String? _stockAt;
  String? _remainStat;
  String? _createdAt;
  num? km;

  Store(
      {String? code,
        String? name,
        String? addr,
        String? type,
        double? lat,
        double? lng,
        String? stockAt,
        String? remainStat,
        String? createdAt}) {
    this._code = code;
    this._name = name;
    this._addr = addr;
    this._type = type;
    this._lat = lat;
    this._lng = lng;
    this._stockAt = stockAt;
    this._remainStat = remainStat;
    this._createdAt = createdAt;
  }

  String get code => _code!;
  set code(String? code) => _code = code!;
  String get name => _name!;
  set name(String? name) => _name = name;
  String get addr => _addr!;
  set addr(String? addr) => _addr = addr;
  String get type => _type!;
  set type(String? type) => _type = type;
  double get lat => _lat!;
  set lat(double? lat) => _lat = lat;
  double get lng => _lng!;
  set lng(double? lng) => _lng = lng;
  String get stockAt => _stockAt!;
  set stockAt(String? stockAt) => _stockAt = stockAt;
  String get remainStat => _remainStat ?? '';
  set remainStat(String? remainStat) => _remainStat = remainStat;
  String get createdAt => _createdAt!;
  set createdAt(String? createdAt) => _createdAt = createdAt;

  Store.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'];
    _addr = json['addr'];
    _type = json['type'];
    _lat = json['lat'];
    _lng = json['lng'];
    _stockAt = json['stock_at'];
    _remainStat = json['remain_stat'];
    _createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['name'] = this._name;
    data['addr'] = this._addr;
    data['type'] = this._type;
    data['lat'] = this._lat;
    data['lng'] = this._lng;
    data['stock_at'] = this._stockAt;
    data['remain_stat'] = this._remainStat;
    data['created_at'] = this._createdAt;
    return data;
  }
}
