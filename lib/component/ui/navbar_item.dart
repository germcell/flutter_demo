import 'package:flutter/cupertino.dart';

/// 给导航栏Item添加动画效果
class NavbarItem extends StatefulWidget {

  final WidgetBuilder builder;

  const NavbarItem({super.key, required this.builder});

  @override
  State<StatefulWidget> createState() {
    return _NavbarItemState();
  }

}

class _NavbarItemState extends State<NavbarItem> with TickerProviderStateMixin {

  // 动画控制器
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );
    _controller.forward();
    _animation = Tween(begin: 0.8, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.builder(context),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}