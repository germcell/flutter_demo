import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../repository/datas/knowledge_data.dart';
import 'knowledage_tab_child_page.dart';
import 'knowledge_details_vm.dart';

/// 体系明细页面
class KnowledgeDetailsTabPage extends StatefulWidget {

  // 体系明细数据，用于渲染tab，每个tab对应一个体系明细数据
  final List<Children>? childrenData;

  const KnowledgeDetailsTabPage({super.key, this.childrenData});

  @override
  State<StatefulWidget> createState() {
    return _KnowledgeDetailsTabPageState();
  }
}

class _KnowledgeDetailsTabPageState extends State<KnowledgeDetailsTabPage>
  with SingleTickerProviderStateMixin {

  KnowledgeDetailsViewModel knowledgeDetailsViewModel = KnowledgeDetailsViewModel();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // 初始化tab数据
    knowledgeDetailsViewModel.initTabList(widget.childrenData);
    // 初始化tabController
    tabController = TabController(length: knowledgeDetailsViewModel.tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KnowledgeDetailsViewModel>(
        create: (context) {
          return knowledgeDetailsViewModel;
        },
        child: Scaffold(
          // 渲染顶部tab
          appBar: AppBar(

            title: TabBar(
              // 去掉每个tab之间的分割线
              dividerHeight: 0,
              // tab的对齐方式
              tabAlignment: TabAlignment.start,
              tabs: knowledgeDetailsViewModel.tabList,
              controller: tabController,
              // 指示器样式
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0, // 指示器厚度
                  color: Colors.orange, // 指示器颜色
                ),
              ),
              // 选中 tab 的样式
              labelStyle: TextStyle(
                fontSize: 14, // 选中 tab 的字体大小
                fontWeight: FontWeight.bold, // 选中 tab 的字体加粗
              ),
              labelColor: Colors.black, // 选中 tab 的字体颜色
              // 未选中 tab 的样式
              unselectedLabelStyle: TextStyle(
                fontSize: 14, // 未选中 tab 的字体大小
                fontWeight: FontWeight.normal, // 未选中 tab 的字体不加粗
              ),
              unselectedLabelColor: Colors.grey, // 未选中 tab 的字体颜色
              // 是否可滑动
              isScrollable: true,
              // 调整 tab 的内边距
              labelPadding: EdgeInsets.symmetric(horizontal: 16.0), // 左右内边距
            ),
          ),
        body: SafeArea(
          // 渲染每个tab对应的页面
          child: TabBarView(
          controller: tabController,
          children: _children(),
        )
      )
    ));
  }

  /// 渲染每个tab对应的页面
  List<Widget> _children() {
    return widget.childrenData?.map((e) {
      return KnowledgeChildTabPage(cid: "${e.id}");
    }).toList() ?? [];
  }

}