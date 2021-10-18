import 'package:flutter/material.dart';
import 'package:flutter_mask/model/store.dart';
import 'package:url_launcher/url_launcher.dart';

class RemainStatListTile extends StatelessWidget {
  final Store store;
  RemainStatListTile(this.store);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(store.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(store.addr),
          Text('${store.km}km')
        ],
      ),
      trailing: _buildRemainStatWidget(store),
      onTap: () {
        _launchURL(store.lat, store.lng);
      },
    );
  }

  Widget _buildRemainStatWidget(Store store) {
    var remainStat = '판매중지';
    var desc = '판매중지';
    var color = Colors.black;

    switch (store.remainStat) {
      case 'plenty' :
        remainStat = '충분';
        desc = '100개 이상';
        color = Colors.green;

        break;
      case 'some' :
        remainStat = '보통';
        desc = '30 ~ 100개';
        color = Colors.yellow;

        break;
      case 'few' :
        remainStat = '부족';
        desc = '2 ~ 30개';
        color = Colors.red;

        break;
      case 'empty' :
        remainStat = '소진임박';
        desc = '1개 이하';
        color = Colors.grey;

        break;
    }

    return Column(
      children: [
        Text(remainStat, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        Text(desc, style: TextStyle(color: color))
      ],
    );
  }

  void _launchURL(double lat, double lng) async {
    final _url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}