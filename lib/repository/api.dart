import 'package:dio/dio.dart';
import '../http/dio_instance.dart';
import 'datas/home_banner_data.dart';

/// API
class Api {
  static Api instance = Api._();

  Api._();

  /// 获取首页banner
  Future getHomeBanner() async {
    Response response = await DioInstance.instance().get("/banner/json");
    return response;
  }

  /// 获取首页推荐文章列表
  Future getHomeList(int page) async {
    // Response response = await dio.get("/article/list/1/json");
    Response response = await DioInstance.instance().get("/article/list/$page/json");
    return response;
  }

  /// 获取首页置顶文章列表
  Future getHomeTopList() async {
    Response response = await DioInstance.instance().get("/article/top/json");
    return response;
  }

  /// 获取分类页面热门搜索关键词
  Future getHotKeyList() async {
    Response response = await DioInstance.instance().get("/hotkey/json");
    return response;
  }

  /// 获取分类页面常用网站列表
  Future getWebsiteList() async {
    Response response = await DioInstance.instance().get("/friend/json");
    return response;
  }

  /// 用户注册
  Future register(String username, String password, String repassword) async {
    Response response = await DioInstance.instance().post("/user/register", queryParameters: {
      "username": username,
      "password": password,
      "repassword": repassword
    });
    return response;
  }

}
