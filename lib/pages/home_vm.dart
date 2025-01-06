import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/datas/home_banner_data.dart';
import 'package:flutter_workspace/datas/home_list_data.dart';
import 'package:flutter_workspace/http/dio_instance.dart';

/// 如果使用浏览器模拟设备，需要设置跨域，物理设备不需要
/// 文章：https://blog.csdn.net/shaoxiukun/article/details/131084044

/// provider状态管理
class HomeViewModel with ChangeNotifier {
  // 数据由provider管理
  List<HomeBannerItemData>? bannerData;
  List<HomeListItemData>? listData;

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
    Response response = await DioInstance.instance().get("/banner/json");
    var data = HomeBannerData.fromJson(response.data);
    if (data.errorCode == 0) {
      bannerData = data.data;
    } else {
      bannerData = [];
    }

    // 通知监听者
    notifyListeners();
  }

  Future getHomeList() async {
    // Response response = await dio.get("/article/list/1/json");
    Response response =
        await DioInstance.instance().get("/article/list/1/json");
    var data = HomeListData.fromJson(response.data);
    if (data.errorCode == 0) {
      listData = data.data?.datas;
    } else {
      listData = [];
    }

    // 通知监听者
    notifyListeners();
  }
}

void main() async {
  print("开始请求...");
  // var data = await HomeViewModel.getBanner();
  // print(data); // 调用并等待异步方法完成
  print("请求结束");
}
