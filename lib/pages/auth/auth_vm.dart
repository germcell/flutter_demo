import 'dart:convert';
import 'package:flutter_workspace/repository/datas/user_data.dart';
import 'package:oktoast/oktoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_workspace/repository/api.dart';
import 'package:flutter_workspace/repository/datas/api_response.dart';

class AuthViewModel with ChangeNotifier {
  AuthInfo authInfo = AuthInfo();

  Future register() async {
    if (authInfo.username == null || authInfo.username!.isEmpty
        || authInfo.password == null || authInfo.password!.isEmpty
        || authInfo.rePassword == null || authInfo.rePassword!.isEmpty) {
      showToast("请输入用户名和密码");
      return;
    }
    if (authInfo.password != authInfo.rePassword) {
      showToast("两次输入的密码不一致");
      return;
    }
    if (authInfo.password!.length < 6 || authInfo.password!.length > 16) {
      showToast("密码长度需为6-16位");
      return;
    }
    var res = await Api.instance.register(authInfo.username!, authInfo.password!, authInfo.rePassword!);
    /// 通过ApiResponse.fromJson方法将返回的数据转换为ApiResponse对象，data通过泛型指定为UserData类型
    var data = ApiResponse<UserData>.fromJson(res.data, (json) => UserData.fromJson(json));
    if (data.errorCode == 0) {
      showToast("注册成功");
    } else {
      showToast(data.errorMsg!);
    }
  }

}

class AuthInfo {
  String? username;
  String? password;
  String? rePassword;
}