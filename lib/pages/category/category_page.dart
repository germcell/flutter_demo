import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 分类页面
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(alignment: Alignment.center, child: Text("分类页面"))));
  }
}
