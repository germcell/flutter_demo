import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_workspace/repository/datas/home_list_data.dart';
import 'package:flutter_workspace/pages/home_vm.dart';
import 'package:flutter_workspace/route/routes.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();
  RefreshController refreshController = RefreshController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    // _initBannerData();
    // 获取数据
    homeViewModel.getHomeBanner();
    homeViewModel.getAllHomeList();
  }

  // 这种强制刷新的方式，不推荐使用，因为会导致整个页面刷新
  // void _initBannerData() async {
  //   _bannerData = await HomeViewModel.getBanner();
  //   // 刷新组件的属性值，因为bannerData是一个异步操作
  //   // 可能会比build后执行，那么页面就无法显示后获取到的数据
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider监听数据变化
    return ChangeNotifierProvider<HomeViewModel>(
        create: (context) {
          return homeViewModel;
        },
        child: Scaffold(
          // 安全区域，除了状态栏和底部栏的区域
          body: SafeArea(
            // 上下拉刷新组件
            child: SmartRefresher(
              controller: refreshController,
              // 上下拉刷新
              enablePullUp: true,
              enablePullDown: true,
              header: const ClassicHeader(),
              footer: const ClassicFooter(),
              // 下拉刷新回调，先加载banner，加载完后再加载列表
              onRefresh: () {
                homeViewModel.getHomeBanner().then((value) {
                  _page = 1;
                  homeViewModel.getAllHomeList();
                  refreshController.refreshCompleted();
                });
              },
              // 上拉加载回调
              onLoading: () {
                homeViewModel.getHomeList(++_page).then((value) {
                  refreshController.loadComplete();
                });
              },
              // 使Column布局的内容滚动
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  _banner(),
                  _listItemView(),
                ],
              )),
            ),
          ),
        ));
  }

  Widget _banner() {
    // 通过Consumer监听数据变化，变化后会刷新组件
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return SizedBox(
        height: 150,
        width: double.infinity,
        child: Swiper(
          viewportFraction: 1.0,
          indicatorLayout: PageIndicatorLayout.NONE,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          itemCount: vm.bannerData?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              // 容器边距
              // margin: const EdgeInsets.all(10),
              height: 150,
              color: Colors.purple,
              child: Image.network(
                vm.bannerData?[index].imagePath ?? "",
                // 图片填充方式
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    });
  }

  Widget _listItemView() {
    return Consumer<HomeViewModel>(builder: (context, vm, child) {
      return ListView.builder(
          // 计算子组件高度
          shrinkWrap: true,
          // 禁止子组件滚动，由父组件负责滚动(_banner)
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, idx) {
            final item = vm.listData?[idx];
            // 或则使用InkWell跳转页面
            return GestureDetector(
                // 点击事件+跳转页面+传递参数
                onTap: () {
                  // 方式1：封装路由
                  Navigator.pushNamed(context, RoutePath.webView, arguments: {
                    "name": "Arguments From HomePage",
                  });
                  // 方式2：直接通过组件名跳转
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return const WebViewPage(title: "From HomePage");
                  // }));
                },
                child: Container(
                  // 容器边距
                  margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  // 内边距
                  padding: EdgeInsets.all(13),
                  // 边框边框
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // 圆形头像
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/id/1/30/30"),
                            radius: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            _getAuthorName(item!),
                            style: TextStyle(color: Colors.black),
                          ),
                          // 横向撑开
                          Expanded(child: SizedBox()),
                          Text("2021-10-10 10:20",
                              style: TextStyle(
                                color: Color.fromARGB(179, 17, 17, 17),
                                fontSize: 12,
                              )),
                          // Expanded(child: SizedBox.width(10),
                          SizedBox(width: 5),
                          (item.type == 1)
                              ? Text("置顶",
                                  style: TextStyle(
                                    // color: Color.fromARGB(89, 158, 94, 94),
                                    color: Colors.blueAccent,
                                    fontSize: 12,
                                  ))
                              : SizedBox(),
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, left: 0, right: 0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                item.title ?? "",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                              ))),
                      Row(
                        children: [
                          (item.superChapterName?.isNotEmpty == true)
                              ? Text(
                                  item.superChapterName ?? "",
                                  style: TextStyle(
                                      color: Color.fromARGB(179, 17, 17, 17),
                                      fontSize: 12),
                                )
                              : SizedBox(),
                          SizedBox(width: 5),
                          Text(
                            "收藏",
                            style: TextStyle(
                                color: Color.fromARGB(179, 17, 17, 17),
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
            ;
          },
          itemCount: vm.listData?.length ?? 0);
    });
  }

  String _getAuthorName(HomeListItemData item) {
    if (item.author?.isNotEmpty == true) {
      return item.author!;
    } else if (item.shareUser?.isNotEmpty == true) {
      return item.shareUser!;
    } else {
      return "";
    }
  }
}
