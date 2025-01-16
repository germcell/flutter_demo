import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_workspace/utils/constants.dart';
import 'dart:developer';

import 'package:flutter_workspace/utils/sp_utils.dart';

class CookieInterceptor extends Interceptor {

  /// 携带cookie请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 取出本地存储的cookie并设置到请求头中
    // request是cookieHeader
    SpUtils.getStringList(Constants.spCookie).then((cookieList) {
      options.headers[HttpHeaders.cookieHeader] = cookieList;
      // 继续往下执行
      handler.next(options);
    });
  }

  /// 登录成功cookie解析
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.requestOptions.path.contains("/user/login")) {
      // TODO 浏览器模拟无法解析到cookie
      // response是setCookieHeader
      dynamic list = response.headers[HttpHeaders.setCookieHeader];
      List<String> cookieList = [];
      if (list is List) {
        for (var c in list) {
          cookieList.add(c);
        }
      }
      // 保存cookie到本地
      SpUtils.saveList(Constants.spCookie, cookieList);
    }
    super.onResponse(response, handler);
  }

}
