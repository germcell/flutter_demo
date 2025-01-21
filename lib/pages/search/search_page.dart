import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workspace/pages/search/search_vm.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../component/web/webview_page.dart';
import '../../component/web/webview_widget.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {
  final String? searchKey;

  const SearchPage({super.key, this.searchKey});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  SearchViewModel searchViewModel = SearchViewModel();
  TextEditingController inputController = TextEditingController();
  late RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    inputController.text = widget.searchKey ?? "";
  }

  void _search(String value) async {
    searchViewModel.search(value, false).then((v) {
      // 检查是否仍然挂载
      if (mounted) {
        // 关闭键盘flutter方式
        FocusScope.of(context).requestFocus(FocusNode());
        // 关闭键盘原生方式
        // SystemChannels.textInput.invokeMethod('TextInput.hide');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchViewModel>(
        create: (context) {
          return searchViewModel;
        },
        child: Scaffold(
            body: SafeArea(
                child: Column(children: [
                  // 搜索框
                  _searchBar((value) => _search(value)),
                  // 搜索结果
                  _searchResult()
                ]
            ))
        )
    );
  }

  Widget _searchBar(ValueChanged<String>? onSubmitted) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 40,
                  // 圆角矩形
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Icon(Icons.search),
                    Expanded(
                        child: TextField(
                          // 输入框控制器
                          controller: inputController,
                          decoration: InputDecoration(
                            // 输入光标居中于输入框
                            contentPadding: EdgeInsets.only(top: 10, bottom: 9, left: 5, right: 5),
                            border: InputBorder.none,
                            hintText: '搜索你感兴趣的内容...',
                            // 提示文字字体大小
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          // 回车键触发查询
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          onSubmitted: onSubmitted,
                        )
                    )
                  ]))),
          GestureDetector(
              onTap: () {
                onSubmitted?.call(inputController.text);
              },
              child: Container(margin: EdgeInsets.only(left: 10), child: Text('搜索'))
          )
        ]));
  }

  Widget _searchResult() {
    return Consumer<SearchViewModel>(builder: (context, vm, child) {
      return Expanded(
          child: SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              enablePullDown: true,
              header: const ClassicHeader(),
              footer: const ClassicFooter(),
              // 回调使用.then，避免使用await导致刷新控件不消失
              onRefresh: () {
                vm.search(inputController.text, false).then((v) {
                  refreshController.refreshCompleted();
                });
              },
              onLoading: () {
                vm.search(inputController.text, true).then((v) {
                  refreshController.loadComplete();
                });
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: searchViewModel.searchData.length,
                itemBuilder: (context, index) {
                  var item = searchViewModel.searchData[index];
                  return Container(
                    margin: EdgeInsets.only(top: 15, left: 5, right: 5),
                    padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: Column(children: [
                      // 在真机上使用gestureDetector无法实现点击效果，使用InkWell代替
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                            return WebViewPage(
                              loadResource: item.link ?? "",
                              webViewType: WebViewType.URL,
                              showTitle: true,
                              title: item.title);
                          }));
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          // Html渲染
                          child: Html(
                            data: item.title ?? "",
                            style: {
                              "html": Style(
                                fontSize: FontSize(14),
                              ),
                            },
                          ),
                        ),
                      )
                    ]),
                  );
                },
              )
          )
      );
    });
  }
}
