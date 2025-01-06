import 'package:dio/dio.dart';
import 'package:flutter_workspace/http/base_api_model.dart';
import 'package:oktoast/oktoast.dart';

/// api返回数据解析拦截器
class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      try {
        var parse = BaseApiModel.fromJson(response.data);
        if (parse.errorCode == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "未登录"));
          showToast("请先登录");
        } else if (parse.errorCode == 0) {
          // 是否需要将数据转换为BaseApiModel?
          handler.next(response);
        } else {
          handler.next(response);
        }
      } catch (e) {
        // 数据解析异常
        handler.reject(DioException(
            requestOptions: response.requestOptions, message: "$e"));
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
