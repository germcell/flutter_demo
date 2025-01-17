import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/repository/datas/knowledge_data.dart';

class KnowledgeViewModel with ChangeNotifier {
  List<KnowledgeItemData> knowledgeData = [];

  void initData() async {
    var apiRes = await Api.instance.getKnowledgeArticle();
    if (apiRes.errorCode == 0) {
      knowledgeData = apiRes.data ?? [];
    }
    notifyListeners();
  }

  String getSubTitle(List<dynamic>? children) {
    if (children == null || children.isEmpty) {
      return "";
    }
    return children.map((item) => item.name).join("、");
  }

}