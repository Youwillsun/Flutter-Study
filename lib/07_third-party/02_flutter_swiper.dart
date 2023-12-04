import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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
      body: FlutterSwiperViewDemo(),
    );
  }
}

class FlutterSwiperViewDemo extends StatelessWidget {
  FlutterSwiperViewDemo({super.key});

  final List<String> imgs = ['images/01.jpg', 'images/02.jpg', 'images/03.jpg'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover,);
            },
            pagination: const SwiperPagination(), // 轮播图指示器
            control: const SwiperControl(), // 轮播图导航
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover,);
            },
            viewportFraction: 0.7,
            scale: 0.7,
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover,);
            },
            itemWidth: 300,
            layout: SwiperLayout.STACK,
          ),
        ),
        Container(
          height: 200,
          child: Swiper(
            itemCount: imgs.length,
            itemBuilder: (context, index) {
              return Image.asset(imgs[index], fit: BoxFit.cover,);
            },
            itemWidth: 300,
            itemHeight: 200,
            layout: SwiperLayout.TINDER, // 使用TINDER效果，不仅要指定宽度，高度也要指定
          ),
        )
      ],
    );
  }
}
