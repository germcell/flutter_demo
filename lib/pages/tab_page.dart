import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/component/ui/navbar_item.dart';

import 'category/category_page.dart';
import 'home_page.dart';
import 'mine/mine_page.dart';
import 'notify/notify_page.dart';

/// 底部导航栏，当有导航栏后需要将此页面设置为路由的首页
/// TODO 封装导航组件，如果有多个页面需要使用底部导航栏，可以直接使用此组件
/// TODO 封装思路：通过传入参数来设置底部导航栏的样式和页面
/// https://www.bilibili.com/video/BV1Qb421Y7SV?spm_id_from=333.788.player.switch&vd_source=576f401fe95063f8ec1d45c1e06864c9&p=17
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabPageState();
  }

}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 组件的主体部分
      body: IndexedStack(
        // 当前渲染的页面索引
        index: _selectedIndex,
        children: [
          HomePage(),
          CategoryPage(),
          NotifyPage(),
          MinePage()
        ],
      ),
      // 底部导航栏组件，Theme覆盖flutter默认的样式（可设置风格切换）
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            // 当前选中的索引
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            // 选中时的字体样式
            selectedLabelStyle: TextStyle(fontSize: 14, color: Colors.black),
            // 未选中时的字体样式
            unselectedLabelStyle: TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.5)),
            items: _tabItems(),
            // 点击切换页面，设置选中的索引
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          )
        )
    );
  }

  List<BottomNavigationBarItem> _tabItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
      label: "首页",
      icon: Image.asset("images/icon_bar_home.png", width: 32, height: 32),
      // TODO 选中后的图标
      // NavbarItem是自定义的组件，用于设置选中后的图标，做了一个动画效果
      activeIcon: NavbarItem(builder: (context) {
        return Image.asset("images/icon_bar_home.png", width: 32, height: 32);
      }),
    ));
    items.add(BottomNavigationBarItem(
      label: "分类",
      icon: Image.asset("images/icon_bar_category.png", width: 32, height: 32),
      activeIcon: NavbarItem(builder: (context) {
        return Image.asset("images/icon_bar_category.png", width: 32, height: 32);
      })
    ));
    items.add(BottomNavigationBarItem(
      label: "通知",
      icon: Image.asset("images/icon_bar_notify.png", width: 32, height: 32),
      activeIcon: NavbarItem(builder: (context) {
        return Image.asset("images/icon_bar_notify.png", width: 32, height: 32);
      })
    ));
    items.add(BottomNavigationBarItem(
      label: "我的",
      icon: Image.asset("images/icon_bar_mine.png", width: 32, height: 32),
      activeIcon: NavbarItem(builder: (context) {
        return Image.asset("images/icon_bar_mine.png", width: 32, height: 32);
      })
    ));
    return items;
  }

}