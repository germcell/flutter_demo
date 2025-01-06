class BaseApiModel<T> {
  int? errorCode;
  String? errorMsg;
  T? data;

  BaseApiModel.fromJson(Map<String, dynamic> json) {
    errorMsg = json['errorMsg'];
    errorCode = json['errorCode'];
    data = json['data'];
  }
}
