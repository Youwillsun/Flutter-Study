import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("首页"),
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings)],
          elevation: 1,
          centerTitle: true),
      body: const StaggerAnimationDemo(),
    );
  }
}

class StaggerAnimationDemo extends StatefulWidget {
  const StaggerAnimationDemo({super.key});

  @override
  State<StaggerAnimationDemo> createState() => _StaggerAnimationDemoState();
}

class _StaggerAnimationDemoState extends State<StaggerAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;
  Animation? sizeAnimation;
  Animation? colorAnimation;
  Animation? roateAnimation;

  animateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller!.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller!.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 创建AnimationController
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    // 创建动画
    animation = CurvedAnimation(parent: controller!, curve: Interval(0.0, 0.5))
      ..addListener(() {
        setState(() {});
      });

    // 让动画反复运行
    animation!.addStatusListener(animateStatus);
    // 其他动画
    sizeAnimation = Tween(begin: 0.0, end: 200.0).animate(animation!);
    colorAnimation = ColorTween(begin: Colors.yellow, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(0.5, 0.8, curve: Curves.bounceIn),
      ),
    )..addListener(() {
        setState(() {});
      });
    roateAnimation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: controller!,
        curve: Interval(0.5, 0.8, curve: Curves.easeIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller!.forward();
            },
            child: Text('重复'),
          ),
          ElevatedButton(
            onPressed: () {
              controller!.stop();
            },
            child: Text('停止'),
          ),
          Opacity(
            opacity: controller!.value,
            child: Transform.rotate(
              angle: roateAnimation!.value,
              child: Container(
                width: sizeAnimation!.value,
                height: sizeAnimation!.value,
                color: colorAnimation!.value,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }
}
