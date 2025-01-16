import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/mine/mine_vm.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../route/routes.dart';

import '../tab_page.dart';

/// 个人信息页面
class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  MineViewModel mineViewModel = MineViewModel();

  @override
  void initState() {
    super.initState();
    mineViewModel.initData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MineViewModel>(
      create: (context) {
        return mineViewModel;
      },
      child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _header(),
                _settingItem("我的收藏", () {}, Icon(Icons.bookmarks_outlined, size: 20)),
                _settingItem("检查更新", () {}, Icon(Icons.upgrade_rounded, size: 20)),
                _settingItem("关于我们", () {}, Icon(Icons.how_to_reg_outlined, size: 20)),
                Consumer<MineViewModel>(builder: (build, vm, child) {
                  if (vm.needLogin) {
                    return SizedBox();
                  }
                  return _settingItem("退出登录", () {
                    mineViewModel.logout((bool success) {
                      if (success) {
                        showToast("退出成功");
                        // 跳转到 TabPage 页面，并清空所有历史路由
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => TabPage()),
                            (route) => false
                        );
                      }
                    });
                  }, Icon(Icons.settings_outlined, size: 20));
                })
              ],
            ),
          )
      ),
    );
  }

  Widget _settingItem(String title, GestureTapCallback? onTap, Widget? leading) {
    return GestureDetector(
      // 点击回调由父组件传入
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10, right: 10), // 左右缩进
          leading: leading,
          title: Text(title, style: TextStyle(fontSize: 13)),
          trailing: Icon(Icons.arrow_forward_ios, size: 20),
        ),
      )
    );
  }

  Widget _header() {
    return Consumer<MineViewModel>(builder: (context, vm, child) {
      return Container(
        width: double.infinity,
        height: 150,
        color: Color.fromRGBO(68, 138, 255, 1.0),
        child: Column(
          // 子组件主轴居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // 未登录才跳转到登录页面
                if (vm.needLogin) {
                  Navigator.pushNamed(context, RoutePath.login);
                }
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/img_default_profile.jpg"),
              ),
            ),
            GestureDetector(
              onTap: () {
                // 未登录才跳转到登录页面
                if (vm.needLogin) {
                  Navigator.pushNamed(context, RoutePath.login);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  vm.username ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 15)),
                )
            )
          ],
        ),
      );
    });
  }

}
