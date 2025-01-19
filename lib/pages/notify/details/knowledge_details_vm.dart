import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/repository/datas/knowledge_child_data.dart';
import 'package:oktoast/oktoast.dart';

import '../../../repository/api.dart';
import '../../../repository/datas/knowledge_data.dart';

class KnowledgeDetailsViewModel with ChangeNotifier {
  // 顶部tab数据
  final List<Tab> tabList = [];

  List<KnowledgeChildItemData> knowledgeChildData = [];
  int _page = 0;
  int pageSize = 10;

  void initTabList(List<Children>? childrenData) {
    if (childrenData == null || childrenData!.isEmpty) {
      return;
    }
    for (var element in childrenData!) {
      tabList.add(Tab(text: element.name));
    }
    notifyListeners();
  }

  /// 获取体系明细子数据
  Future getKnowledgeArticleList(String cid, bool loadMore) async {
    if (loadMore) {
      _page++;
    } else {
      _page = 0;
      knowledgeChildData.clear();
    }
    var apiRes = await Api.instance.getKnowledgeArticleList(_page, cid, pageSize);
    if (apiRes.errorCode == 0) {
      if (apiRes.data?.datas != null && apiRes.data!.datas!.isNotEmpty) {
        knowledgeChildData.addAll(apiRes.data!.datas!);
        notifyListeners();
      } else {
        showToast('没有新的数据了');
        if (loadMore && _page > 0) {
          _page--;
        }
      }
    } else {
      // 确保在加载更多数据失败时，页码不会错误地递增，从而避免下次加载更多数据时跳过某些数据。
      // 保持页码的正确性，以便用户再次尝试加载更多数据时，能够从正确的页码开始。
      if (loadMore && _page > 0) {
        _page--;
      }
      showToast('加载失败，请重试');
    }
  }

  /// 获取用户名称
  String getName(KnowledgeChildItemData item) {
    if (item.author != null && item.author?.isNotEmpty == true) {
      return item.author!;
    }
    if (item.shareUser != null && item.shareUser?.isNotEmpty == true) {
      return item.shareUser!;
    }
    return "匿名用户";
  }

}