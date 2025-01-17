import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/repository/datas/home_banner_data.dart';
import 'package:flutter_workspace/repository/datas/home_list_data.dart';
import 'package:flutter_workspace/http/dio_instance.dart';
import 'package:flutter_workspace/repository/datas/home_top_list_data.dart';
import 'package:intl/intl.dart';
import 'dart:developer';
import 'package:oktoast/oktoast.dart';

import '../repository/datas/api_response.dart';


/// 如果使用浏览器模拟设备，需要设置跨域，物理设备不需要
/// 文章：https://blog.csdn.net/shaoxiukun/article/details/131084044

/// provider状态管理
class HomeViewModel with ChangeNotifier {
  // 数据由provider管理
  List<HomeBannerItemData>? bannerData;
  List<HomeListItemData>? listData = [];

  // late Dio dio;
  //
  // HomeViewModel() {
  //   initDio();
  // }

  // void initDio() {
  //   try {
  //     dio = Dio();
  //     dio.options = BaseOptions(
  //       baseUrl: "https://www.wanandroid.com",
  //       method: "GET",
  //       connectTimeout: Duration(seconds: 30),
  //       receiveTimeout: Duration(seconds: 30),
  //       sendTimeout: Duration(seconds: 30),
  //     );
  //   } catch (e) {
  //     print("Dio 初始化失败: $e");
  //   }
  // }

  // 异步方法
  Future getHomeBanner() async {
    // Response response = await dio.get("/banner/json");
    var response = await Api.instance.getHomeBanner();
    var data = HomeBannerData.fromJson(response.data);
    if (data.errorCode == 0) {
      bannerData = data.data ?? [];
    } else {
      // TODO 其它业务状态码处理
    }
    // 通知监听者
    notifyListeners();
  }

  Future getHomeList(int page) async {
    // Response response = await dio.get("/article/list/1/json");
    var response = await Api.instance.getHomeList(page);
    var data = HomeListData.fromJson(response.data);
    if (data.errorCode == 0) {
      listData?.addAll(data.data?.datas ?? []);
    } else {
      // TODO 其它业务状态码处理
    }
    // 通知监听者
    notifyListeners();
  }

  Future getHomeTopList() async {
    var response = await Api.instance.getHomeTopList();
    var data = HomeTopListData.fromJson(response.data);
    if (data.errorCode == 0) {
      listData?.clear();
      listData?.addAll(data.data ?? []);
    } else {
      // TODO 其它业务状态码处理
    }
    notifyListeners();
  }

  /// 获取首页所有list数据，包普通数据和置顶数据
  Future getAllHomeList() async {
    await getHomeTopList();
    await getHomeList(1);
  }

  String formatTime(num? time) {
    // 如果 time 为空，返回 null
    if (time == null) {
      showToast("请先登录");
      return "";
    }
    // 解析时间戳为 DateTime 对象
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(time.toInt());
    // 使用 DateFormat 格式化日期和时间
    final String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(date);
    return formattedDate;
  }

  /// 收藏文章
  Future collectArticle(num? id, int idx) async {
    if (id == null) {
      showToast("收藏失败:C234");
      return;
    }
    var response = await Api.instance.collectArticle(id);
    var apiResponse = ApiResponse.fromJson(response.data, null);
    if (apiResponse.isSuccess) {
      listData?[idx].collect = true;
      notifyListeners();
      showToast("收藏成功");
    } else {
      showToast(apiResponse.errorMsg);
    }
  }

  /// 取消收藏文章
  Future unCollectArticle(num? id, int idx) async {
    if (id == null) {
      showToast("取消收藏失败:C234");
      return;
    }
    var apiRes = await Api.instance.unCollectArticle(id);
    if (apiRes.isSuccess) {
      listData?[idx].collect = false;
      // 数据改变后通知监听者
      notifyListeners();
      showToast("取消收藏成功");
    } else {
      showToast(apiRes.errorMsg);
    }
  }

}

void main() async {
  print("开始请求...");
  // var data = await HomeViewModel.getBanner();
  // print(data); // 调用并等待异步方法完成
  print("请求结束");
}
