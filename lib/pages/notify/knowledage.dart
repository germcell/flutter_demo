import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/route/routes.dart';
import 'package:provider/provider.dart';

import '../../repository/datas/knowledge_data.dart';
import 'details/knowledage_details_tab_page.dart';
import 'knowledge_vm.dart';

/// 消息页面
class KnowledgePage extends StatefulWidget {
  const KnowledgePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgePageState();
  }
}

class _KnowledgePageState extends State<KnowledgePage> {
  KnowledgeViewModel knowledgeViewModel = KnowledgeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      knowledgeViewModel.initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeViewModel>(
        create: (context) {
          return knowledgeViewModel;
        },
        child: Scaffold(
            body: SafeArea(
                child: Align(
                    alignment: Alignment.center, child: _list())))
    );
  }

  Widget _list() {
    return Consumer<KnowledgeViewModel>(builder: (build, vm, child) {
      return ListView.builder(
          // 计算子组件高度
          shrinkWrap: true,
          itemCount: vm.knowledgeData.length,
          itemBuilder: (context, index) {
            var item = vm.knowledgeData[index];
            return _itemView(item, vm.getSubTitle(item.children));
          });
    });
  }

  Widget _itemView(KnowledgeItemData? item, String subTitle) {
    return GestureDetector(
      onTap: () {
        // 跳转到体系明细页面，直接传递组件
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KnowledgeDetailsTabPage(childrenData: item?.children),
          ),
        );
      },
      child: Container(
          margin: const EdgeInsets.only(top: 7, left: 6, right: 6),
          padding: const EdgeInsets.all(8),
          // 边框
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
              children: [
                Row(
                  children: [
                    Text(item?.name ?? "", style: TextStyle(fontSize: 15),),
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(subTitle, style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ))
              ])),
    );
  }

}