import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebViewPage extends StatefulWidget {
  String name = "";

  WebViewPage({super.key, required this.name});

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {

  @override
  void initState() {
    // 初始化
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 回调函数，在组件渲染完成后执行
      // 在渲染完后获取路由参数
      _getRouteArguments();
    });
  }

  void _getRouteArguments() {
    // 获取路由传参
    var argMap = ModalRoute.of(context)?.settings.arguments;
    if (argMap is Map) {
      // 值状态改变
      setState(() {
        widget.name = argMap["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name ?? ""),
        ),
        body: SafeArea(
            // 返回按钮
            child: InkWell(onTap: () {
              Navigator.pop(context);
            },
            child: Container(width: 200, height: 50, child: Text("返回"))
            ),
        )
    );
  }
}
