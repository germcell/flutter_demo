import 'package:dio/dio.dart';
import 'package:flutter_workspace/repository/datas/api_response.dart';
import 'package:flutter_workspace/repository/datas/knowledge_child_data.dart';
import 'package:flutter_workspace/repository/datas/knowledge_data.dart';
import '../http/dio_instance.dart';
import 'datas/home_banner_data.dart';
import 'datas/knowledge_list_data.dart';
import 'datas/search_data.dart';

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

  /// 用户登录
  Future login(String username, String password) async {
    Response response = await DioInstance.instance().post("/user/login", queryParameters: {
      "username": username,
      "password": password
    });
    return response;
  }

  /// 收藏文章
  Future collectArticle(num? id) async {
    Response response = await DioInstance.instance().post("/lg/collect/$id/json");
    return response;
  }

  /// 取消收藏文章
  Future<ApiResponse> unCollectArticle(num? id) async {
    Response response = await DioInstance.instance().post("/lg/uncollect_originId/$id/json");
    return ApiResponse.fromJson(response.data, null);
  }

  /// 退出登录
  Future<ApiResponse> logout() async {
    Response response = await DioInstance.instance().get("/user/logout/json");
    return ApiResponse.fromJson(response.data, null);
  }

  /// 获取体系数据
  Future<KnowledgeData> getKnowledgeArticle() async {
    Response response = await DioInstance.instance().get("/tree/json");
    return KnowledgeData.fromJson(response.data);
  }

  /// 获取体系下的文章
  Future<KnowledgeChildData> getKnowledgeArticleList(int page, String cid, int pageSize) async {
    Response response = await DioInstance.instance().get("/article/list/$page/json", queryParameters: {
      "cid": cid,
      "page_size": pageSize
    });
    return KnowledgeChildData.fromJson(response.data);
  }

  /// 搜索文章
  Future<SearchData> searchArticle(int page, String key, int pageSize) async {
    Response response = await DioInstance.instance().post("/article/query/$page/json", queryParameters: {
      "k": key,
      "page_size": pageSize
    });
    return SearchData.fromJson(response.data);
  }

}
