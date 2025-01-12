import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 个人信息页面
class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _header(),
              _settingItem("我的收藏", () {}, Icon(Icons.bookmarks_outlined, size: 20)),
              _settingItem("检查更新", () {}, Icon(Icons.upgrade_rounded, size: 20)),
              _settingItem("关于我们", () {}, Icon(Icons.how_to_reg_outlined, size: 20)),
            ],
          ),
        )
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
    return Container(
      width: double.infinity,
      height: 150,
      color: Color.fromRGBO(68, 138, 255, 51),
      child: Column(
        // 主轴居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("images/img_default_profile.jpg"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text("用户名", style: TextStyle(color: Colors.white, fontSize: 15)),
          )
        ],
      ),
    );
  }

}
