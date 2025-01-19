import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workspace/pages/auth/login_page.dart';
import 'package:flutter_workspace/pages/auth/register_page.dart';
import 'package:flutter_workspace/pages/notify/details/knowledage_details_tab_page.dart';
import 'package:flutter_workspace/pages/search/search_page.dart';
import 'package:flutter_workspace/pages/tab_page.dart';
import 'package:flutter_workspace/pages/web_view_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // 路由名称
    switch (settings.name) {
      case RoutePath.tab:
        return pageRoute(TabPage(), settings: settings);
      case RoutePath.webView:
        return pageRoute(WebViewPage(name: "Form HomePage"), settings: settings);
      case RoutePath.login:
        return pageRoute(LoginPage(), settings: settings);
      case RoutePath.register:
        return pageRoute(RegisterPage(), settings: settings);
      case RoutePath.knowledgeDetailsTabPage:
        return pageRoute(KnowledgeDetailsTabPage(), settings: settings);
      case RoutePath.search:
        return pageRoute(SearchPage(), settings: settings);
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
  static const String tab = '/';

  // WebView
  static const String webView = '/WebViewPage';

  // login
  static const String login = '/login';

  // register
  static const String register = '/register';

  // 体系明细页面
  static const String knowledgeDetailsTabPage = '/knowledge/details';

  // 搜索页面
  static const String search = '/search';
}
