import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workspace/pages/web_view_page.dart';

import '../pages/home_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // 路由名称
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage(), settings: settings);
      case RoutePath.webView:
        return pageRoute(WebViewPage(name: "Form HomePage"),
            settings: settings);
    }
    // 未定义的路由
    return pageRoute(Scaffold(
      body: SafeArea(
          child: Center(child: Text('No route defined for ${settings.name}'))),
    ));
  }

  // settings传值
  static MaterialPageRoute pageRoute(Widget page,
      {RouteSettings? settings,
      bool? maintainState,
      bool? fullscreenDialog,
      bool? allowSnapshotting}) {
    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings,
        maintainState: maintainState ?? true,
        fullscreenDialog: fullscreenDialog ?? false,
        allowSnapshotting: allowSnapshotting ?? true);
  }
}

class RoutePath {
  // 首页
  static const String home = '/';

  // WebView
  static const String webView = '/WebViewPage';
}
