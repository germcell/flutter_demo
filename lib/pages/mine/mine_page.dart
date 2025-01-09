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
            child: Align(alignment: Alignment.center, child: Text("个人信息页面"))));
  }
}
