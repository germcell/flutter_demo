/// 通用的网络请求返回数据格式
class ApiResponse<T> {
  T? data;
  int errorCode;
  String errorMsg;

  ApiResponse({
    this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json)? fromJsonT) {
    return ApiResponse<T>(
      data: fromJsonT != null && json['data'] != null ? fromJsonT(json['data']) : null,
      errorCode: json['errorCode'],
      errorMsg: json['errorMsg'],
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'data': data != null ? toJsonT(data!) : null,
      'errorCode': errorCode,
      'errorMsg': errorMsg,
    };
  }
}