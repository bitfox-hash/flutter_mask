import 'dart:convert';
import 'package:flutter_mask/model/store.dart';
import 'package:http/http.dart' as http;
import 'package:latlong/latlong.dart';

class StoreRepository {
  final _distance = const Distance();

  Future<List<Store>> fetch(double lat, double lng) async {
    final List<Store> stores = <Store>[];

    var url = Uri.https('gist.githubusercontent.com', '/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
        final jsonStores = jsonResult['stores'];

        // stores.clear();
        jsonStores.forEach((e) {
          final store = Store.fromJson(e);
          final num? km = _distance.as(LengthUnit.Kilometer, LatLng(store.lat, store.lng), LatLng(lat, lng));
          store.km = km;
          stores.add(store);
        });
        print('fetch success');

        return stores.where((e) {
          return e.remainStat == 'plenty' || e.remainStat == 'some' || e.remainStat == 'few';
        }).toList()..sort((a, b) => a.km!.compareTo(b.km!));  //asc 정렬
      } else {
        return [];
      }
    } finally {
      return [];
    }
  }
}