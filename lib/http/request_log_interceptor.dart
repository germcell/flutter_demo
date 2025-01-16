import 'package:dio/dio.dart';
import 'dart:developer';

/// api请求日志打印拦截器
class RequestLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("<===============================request===============================>");
    log("url: ${options.uri}");
    log("headers: ${options.headers}");
    log("method: ${options.method}");
    log("queryParameters: ${options.queryParameters}");
    log("requestBody: ${options.data}");
    log("<===============================request===============================>\n");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("<===============================response===============================>");
    log("pth: ${response.realUri}");
    log("headers: ${response.headers}");
    log("statusCode: ${response.statusCode}");
    log("data: ${response.data}");
    log("extra: ${response.extra.toString()}");
    log("<===============================response===============================>\n");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("<===============================request onError===============================>");
    log("请求异常: ${err.toString()}");
    log("<===============================request onError===============================>\n");
    super.onError(err, handler);
  }
}
