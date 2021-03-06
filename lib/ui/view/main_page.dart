import 'package:flutter/material.dart';
import 'package:flutter_mask/ui/widget/remain_stat_list_tile.dart';
import 'package:flutter_mask/view_model/store_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length}곳'),
          actions: [
            IconButton(
                onPressed: () {
                  storeModel.fetch();
                },
                icon: const Icon(Icons.refresh)
            )
          ],
        ),
        body: _buildBody(storeModel)
    );
  }

  Widget _buildBody(StoreModel model) {
    if (model.isLoding) {
      return lodingWidget();
    }

    if (model.stores.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('인터넷이 연결되어 있는지 확인해 주세요.')
          ],
        ),
      );
    }

    return ListView(
      children: model.stores
          .map((e) {
        return RemainStatListTile(e);
      }).toList(),
    );
  }

  Widget lodingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}