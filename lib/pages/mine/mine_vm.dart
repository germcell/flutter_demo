import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/utils/constants.dart';
import 'package:flutter_workspace/utils/sp_utils.dart';

class MineViewModel with ChangeNotifier {
  String? username;
  bool needLogin = false;

  /// 从本地获取用户名，判断是否需要登录
  Future initData() async {
    SpUtils.getString(Constants.spUsername).then((value) {
      if (value == null || value == "") {
        username = "未登录";
        needLogin = true;
      } else {
        username = value;
        needLogin = false;
      }
      notifyListeners();
    });
  }

  /// 退出登录成功后清除本地数据，并callback页面跳转
  Future logout(ValueChanged<bool> callback) async {
    var apiRes = await Api.instance.logout();
    if (apiRes.isSuccess) {
      SpUtils.removeAll().then((value) {
        if (value == true) {
          callback(true);
        } else {
          callback(false);
        }
      });
    }
  }

}

