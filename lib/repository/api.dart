import 'package:dio/dio.dart';
import '../http/dio_instance.dart';
import 'datas/home_banner_data.dart';

/// API
class Api {
  static Api instance = Api._();

  Api._();

  Future getHomeBanner() async {
    Response response = await DioInstance.instance().get("/banner/json");
    return response;
  }

  Future getHomeList() async {
    // Response response = await dio.get("/article/list/1/json");
    Response response = await DioInstance.instance().get("/article/list/1/json");
    return response;
  }

  Future getHomeTopList() async {
    Response response = await DioInstance.instance().get("/article/top/json");
    return response;
  }

}
