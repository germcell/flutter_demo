import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../repository/datas/knowledge_data.dart';
import 'knowledge_details_vm.dart';

/// 体系明细子页面
class KnowledgeChildTabPage extends StatefulWidget {

  final String cid;

  const KnowledgeChildTabPage({super.key, required this.cid});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeChildTabPageState();
  }
}

class _KnowledgeChildTabPageState extends State<KnowledgeChildTabPage> {

  KnowledgeDetailsViewModel knowledgeDetailsViewModel = KnowledgeDetailsViewModel();
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    knowledgeDetailsViewModel.getKnowledgeArticleList(widget.cid, false);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeDetailsViewModel>(
        create: (context) {
          return knowledgeDetailsViewModel;
    }, child: Scaffold(
      body: Consumer<KnowledgeDetailsViewModel>(builder: (build, vm, child) {
        return SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          enablePullDown: true,
          header: const ClassicHeader(),
          footer: const ClassicFooter(),
          // 回调使用.then，避免使用await导致刷新控件不消失
          onRefresh: () {
            vm.getKnowledgeArticleList(widget.cid, false).then((v) {
              refreshController.refreshCompleted();
            });
          },
          onLoading: () {
            vm.getKnowledgeArticleList(widget.cid, true).then((v) {
              refreshController.loadComplete();
            });
          },
          child: ListView.builder(
            itemCount: vm.knowledgeChildData.length,
            itemBuilder: (context, index) {
              var item = vm.knowledgeChildData[index];
              return Container(
                margin: const EdgeInsets.only(top: 10, bottom: 3, left: 15, right: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(item.title ?? "", style: TextStyle(fontSize: 15),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(children: [
                        Text(vm.getName(item), style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Expanded(child: SizedBox()),
                        Text(item.niceDate ?? "", style: TextStyle(fontSize: 12, color: Colors.grey))
                      ])
                    ),
                  ]
                ),
              );
            },
          ),
        );
      }
    )));
  }

}