import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/repository/datas/search_data.dart';
import 'package:oktoast/oktoast.dart';

class SearchViewModel with ChangeNotifier {
  int _page = 0;
  int pageSize = 15;
  List<SearchItemData> searchData = [];
  bool _isLoading = false;

  /// 搜索
  Future search(String key, bool loadMore) async {
    if (_isLoading) return; // 防止重复加载
      _isLoading = true;

    if (loadMore) {
      _page++;
    } else {
      _page = 0;
      searchData.clear(); // 清空旧数据
    }
    var apiRes = await Api.instance.searchArticle(_page, key, pageSize);
    if (apiRes.errorCode == 0) {
      if (apiRes.data?.datas != null && apiRes.data!.datas!.isNotEmpty) {
        searchData.addAll(apiRes.data!.datas!);
        notifyListeners();
      } else {
        if (loadMore && _page > 0) {
          _page--;
        }
        showToast("没有新的数据了");
      }
    } else {
      if (loadMore && _page > 0) {
        _page--;
      }
    }
    _isLoading = false; // 重置加载状态
  }

}