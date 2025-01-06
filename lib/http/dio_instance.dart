import 'package:dio/dio.dart';
import 'package:flutter_workspace/http/request_log_interceptor.dart';
import 'package:flutter_workspace/http/response_interceptor.dart';
import 'http_method.dart';

/// dio单例
class DioInstance {
  static DioInstance? _instance;

  final Dio _dio = Dio();
  final _defaultTime = Duration(seconds: 30);

  // 私有构造函数
  DioInstance._();

  // _instance不为空则返回_instance，否则返回DioInstance._()
  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  // main.dart中调用
  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.get,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    try {
      _dio.options = BaseOptions(
        baseUrl: baseUrl,
        method: httpMethod,
        connectTimeout: connectTimeout ?? _defaultTime,
        receiveTimeout: receiveTimeout ?? _defaultTime,
        sendTimeout: sendTimeout ?? _defaultTime,
      );
      // 添加拦截器
      _dio.interceptors.add(RequestLogInterceptor());
      _dio.interceptors.add(ResponseInterceptor());
    } catch (e) {
      print("Dio 初始化失败: $e");
    }
  }

  /// get request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options ??
          Options(
              method: HttpMethod.get,
              receiveTimeout: _defaultTime,
              sendTimeout: _defaultTime,
              responseType: ResponseType.json),
    );
  }
}
