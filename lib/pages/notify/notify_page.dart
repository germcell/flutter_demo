import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 消息页面
class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotifyPageState();
  }
}

class _NotifyPageState extends State<NotifyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(alignment: Alignment.center, child: Text("消息通知页面"))));
  }
}
