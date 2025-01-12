import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/repository/datas/hot_key_data.dart';
import 'package:flutter_workspace/repository/datas/web_site_data.dart';

/// 分类页面状态管理
class CategoryViewModel with ChangeNotifier {
  List<HotKeyListItemData>? hotKeyList = [];
  List<WebSiteListItemData>? webSiteList = [];

  Future getHotKeyList() async {
    var response = await Api.instance.getHotKeyList();
    var data = HotKeyData.fromJson(response.data);
    if (data.errorCode == 0) {
      hotKeyList = data.data ?? [];
    } else {
      // TODO 其它业务状态码处理
    }
    notifyListeners();
  }

  Future getWebsiteList() async {
    var response = await Api.instance.getWebsiteList();
    var data = WebSiteData.fromJson(response.data);
    if (data.errorCode == 0) {
      webSiteList = data.data ?? [];
    } else {
      // TODO 其它业务状态码处理
    }
    notifyListeners();
  }

}