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
    StringBuffer sb = StringBuffer();
    for (var item in children) {
      sb.write(item.name);
      sb.write("、");
    }
    return sb.toString();
  }

}