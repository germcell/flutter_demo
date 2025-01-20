import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

/// 自定义加载中组件
class Loading {

  Loading._();

  /// 开启加载中动画
  static Future showLoading({Duration? duration}) async {
    showToastWidget(
      Container(
        // 透明背景
        color: Colors.transparent,
        // 填充屏幕
        constraints: BoxConstraints.expand(),
        child: Align(
          // alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ),
        ),
      ),
      handleTouch: true,
      // 持续时间，由dismissAll()关闭
      duration: duration ?? Duration(days: 1),
    );
  }

  /// 关闭加载中动画
  static void dismissAll() {
    dismissAllToast();
  }

}