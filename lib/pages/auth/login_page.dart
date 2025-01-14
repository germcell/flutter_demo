import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace/pages/tab_page.dart';
import 'dart:developer';

import '../../route/routes.dart';
import 'auth_vm.dart';

class LoginPage extends StatefulWidget {
  // String? echoUsername;
  // LoginPage({super.key, this.echoUsername});
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _usernameController;
  AuthViewModel authViewModel = AuthViewModel();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();

    // 回调函数，在组件渲染完成后执行
    // 如果有传递用户名，则显示在输入框中（注册用户名回显）
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registerEchoUsername();
    });
  }
  void _registerEchoUsername() {
    var argMap = ModalRoute.of(context)?.settings.arguments;
    // log("argMap: $argMap");
    if (argMap is Map) {
      setState(() {
        _usernameController?.text = argMap["echoUsername"] ?? "";
        // log("controller: ${_usernameController?.text}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(),
            _commonInput("请输入用户名", Icon(Icons.person), controller: _usernameController),
            SizedBox(height: 10),
            _commonInput("请输入密码", Icon(Icons.lock), obscureTextFlag: true, onChanged: (value) {
              authViewModel.authInfo.password = value;
            }),
            SizedBox(height: 20),
            _cmdButton(),
          ],
        ),
      )
    );
  }

  Widget _cmdButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePath.register);
            },
            child: Text("注册"),
          )
        ),
        Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () async {
              authViewModel.authInfo.username = _usernameController?.text;
              final data = await authViewModel.login();
              if (data != null && mounted) {
                // Navigator.pushNamed(context, RoutePath.tab);
                // 跳转到 TabPage 页面，并清空所有历史路由
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TabPage()),
                  (route) => false
                );
              }
            },
            child: Text("登录"),
          )
        ),
      ]
    );
  }

  /// 输入框组件
  Widget _commonInput(String? hintText, Icon? icon, {
    bool obscureTextFlag = false,
    TextEditingController? controller,
    ValueChanged<String>? onChanged
  }) {
    return TextField(
      // 获取输入内容方式1：内容变化控制器，可以获取输入框的内容
      controller: controller,
      // 获取输入内容方式2：监听输入内容变化
      onChanged: onChanged,
      obscureText: obscureTextFlag, // 隐藏输入内容
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText ?? "请输入",
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Text("Login", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    );
  }
}