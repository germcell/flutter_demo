import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
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
            _commonInput("请输入用户名", Icon(Icons.person)),
            SizedBox(height: 10),
            _commonInput("请输入密码", Icon(Icons.lock), obscureTextFlag: true),
            SizedBox(height: 10),
            _commonInput("请再次输入密码", Icon(Icons.lock), obscureTextFlag: true),
            SizedBox(height: 20),
            _cmdButton(),
            // TextField(
            //   decoration: InputDecoration(
            //     hintText: "输入密码",
            //     prefixIcon: Icon(Icons.lock)
            //   ),
            // ),
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
          width: 120,
          height: 40,
          margin: EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("点击注册"),
          )
        )
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
      child: Text("Register", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
    );
  }
}