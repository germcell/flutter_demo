import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/category/category_vm.dart';
import 'package:flutter_workspace/pages/search/search_page.dart';
import 'package:provider/provider.dart';

import '../../component/web/webview_page.dart';
import '../../component/web/webview_widget.dart';
import '../../route/routes.dart';

/// 分类页面
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryViewModel categoryViewModel = CategoryViewModel();

  @override
  void initState() {
    super.initState();
    setState(() {
      categoryViewModel.getHotKeyList();
      categoryViewModel.getWebsiteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryViewModel>(
        create: (context) {
          return categoryViewModel;
        },
        child: Scaffold(
            // 安全区域，除了状态栏和底部栏的区域
            body: SafeArea(
                // SingleChildScrollView可以滚动
                child: SingleChildScrollView(
                    child: Column(children: [
                      // 搜索框
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutePath.search);
                        },
                        child: _hotkeySearch(),
                      ),
                      // 热词列表
                      _hotkeyList(),
                      // 网站搜索框
                      _websiteSearch(),
                      // 网站列表
                      _websiteList(),
        ])))));
  }

  Widget _websiteList() {
    return Consumer<CategoryViewModel>(builder: (context, model, child) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 7, right: 7),
        // grid布局
        child: GridView.builder(
          // 计算子组件高度
          shrinkWrap: true,
          // 禁止子组件滚动，由父组件负责滚动(_banner)
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // 最大横轴范围（宽度）
            maxCrossAxisExtent: 120,
            // 横轴间距
            crossAxisSpacing: 5,
            // 纵轴间距
            mainAxisSpacing: 5,
            // 子组件宽高比，grid盒子的上下padding只有设置这个属性才会生效
            childAspectRatio: 2.3,
          ),
          itemBuilder: (context, idx) {
            final item = model.webSiteList?[idx];
            return GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, RoutePath.webView, arguments: {
                //   "name": "Category WebSite",
                // });
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return WebViewPage(
                          loadResource: item?.link ?? "",
                          webViewType: WebViewType.URL,
                          showTitle: true,
                          title: item?.name ?? "");
                    }));
              },
              child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(left: 2, right: 2, bottom: 3),
                padding: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                // child: Text(item?.name ?? "", style: TextStyle(color: Colors.black)),
                child: Text(
                  item?.name ?? "",
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis, // 超出部分显示为 ...
                  maxLines: 1, // 只显示一行
                ),
              ),
            );
          },
          itemCount: model.webSiteList?.length ?? 0,
        ),
      );
    });
  }

  Widget _websiteSearch() {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 5, left: 1, right: 1),
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child:
          Row(children: [Text("常用网站", style: TextStyle(color: Colors.black))]),
    );
  }

  Widget _hotkeySearch() {
    return Container(
      // 容器边距
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 1, right: 1),
      // 内边距
      padding: EdgeInsets.all(9),
      // 边框边框
      decoration: BoxDecoration(
        // 上下边框
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(children: [
          Text("搜索热词", style: TextStyle(color: Colors.black)),
          Expanded(child: SizedBox()),
          Icon(Icons.search)
        ],
      ),
    );
  }

  Widget _hotkeyList() {
    return Consumer<CategoryViewModel>(builder: (context, model, child) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 7, right: 7),
        // padding: EdgeInsets.symmetric(horizontal: 5),
        // grid布局
        child: GridView.builder(
          // 计算子组件高度
          shrinkWrap: true,
          // 禁止子组件滚动，由父组件负责滚动(_banner)
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // 最大横轴范围（宽度）
            maxCrossAxisExtent: 120,
            // 横轴间距
            crossAxisSpacing: 5,
            // 纵轴间距
            mainAxisSpacing: 5,
            // 子组件宽高比，grid盒子的上下padding只有设置这个属性才会生效
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, idx) {
            final item = model.hotKeyList?[idx];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage(searchKey: item?.name ?? "")
                ));
              },
              child: Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(left: 2, right: 2, bottom: 3),
                padding: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(15),
                ),
                // child: Text(item?.name ?? "", style: TextStyle(color: Colors.black)),
                child: Text(
                  item?.name ?? "",
                  style: TextStyle(color: Colors.black),
                  overflow: TextOverflow.ellipsis, // 超出部分显示为 ...
                  maxLines: 1, // 只显示一行
                ),
              ),
            );
          },
          itemCount: model.hotKeyList?.length ?? 0,
        ),
      );
    });
  }
}
