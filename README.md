# Flutter学习

[toc]

Flutter中一切内容都是组件（Widget）

- 无状态组件（StatelessWidget）
- 有状态组件（StatefulWidget）

## 初始化项目

### 创建项目

1. `flutter create myporject`
2. `cd myproject`
3. `flutter run`

### 项目目录

```
flutter_app
|--- android               # 安卓目录
|--- build                 # 构建目录
|--- ios                   # ios目录
|--- lib                   # 开发目录，相当于src目录
|------ mian.dart          # 入口文件，相当于index.js
|--- test                  # 测试目录
|------ .gitignore         # Git提交忽略文件
|--- pubspec.lock          # 项目依赖锁定信息（相当于npm中的package-lock.json）
|--- pubspec.yaml          # 项目依赖配置（相当于npm中的package.json）
```

### Material Desgin

Google推出的前端UI解决方案

官网：https://m3.material.io/

中文网：https://www.mdui.org/design/

## APP 结构

1. MaterialApp - Material Design提供的骨架

- title（任务管理器中的标题）
- home（主内容）
- debugShowCheckedModeBanner（是否显示左上角调试标记）

2. Scaffold - 脚手架（骨架）

- appBar（应用头部）
- body（应用主体）
- floatingActionButton（浮动按钮）
- drawer（左侧抽屉菜单）
- endDrawer（右侧抽屉菜单）

```mermaid
graph TB
    MyApp --> MaterialApp
    MaterialApp --> title
    MaterialApp --> home
    MaterialApp --> debugShowCheckedModeBanner
    title
    home --> Scaffold
    debugShowCheckedModeBanner
    Scaffold --> drawer
    Scaffold --> appBar
    Scaffold --> body
    Scaffold --> floatingActionButton
    Scaffold --> endDrawer
    drawer
    appBar --> AppBar
    body --> jutizujian
    floatingActionButton
    endDrawer
    AppBar --> leading
    AppBar --> title2
    AppBar --> actions
    leading
    title2[title]
    actions
    jutizujian[具体组件] --> attribute1
    jutizujian[具体组件] --> attribute2
    jutizujian[具体组件] --> attributeOther
    attribute1[属性1]
    attribute2[属性2]
    attributeOther[...]
```

MaterialApp 可以看成顶级组件

Scaffold 骨架组件，支撑了APP的骨架

头部的AppBar

body的具体组件

## 基础组件

### Text（文本）

- TextDirection 文本方向
- TextStyle 文本样式
  - Colors 文本颜色
  - FontWeight 字体粗细
  - FontStyle 字体样式
- TextAlign 文本对齐
- TextOverflow 文本溢出
- maxLines 指定显示的行数

RichText 与 TextSpan 一般组合在一起使用，作用是给一段文本声明多个不同的样式。

```dart
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "我们在 YouTube 上有一个 Flutter 频道，欢迎订阅！更多视频和播放列表介绍，以及社区制作的视频教程，可以查看我们的 Flutter 技术视频资源 页面。同时，你可以关注 “Google中国”的哔哩哔哩账号 了解更多更全面的谷歌技术中文内容，也可以关注 “Flutter 社区”的哔哩哔哩账号 了解更多来自社区的内容更新。",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.blue,
          ),
          textAlign: TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.linear(1.5),
        ),
        RichText(
            text: const TextSpan(
                text: "Hello",
                style: TextStyle(fontSize: 40, color: Colors.red),
                children: [
                  TextSpan(
                    text: "Flutter",
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  TextSpan(
                    text: "你好世界",
                    style: TextStyle(fontSize: 30, color: Colors.black45),
                  )
                ]
            )
        )
      ],
    );
  }
```

#### 设置定义字体

下载并导入字体

- Google Fonts：https://fonts.google.com/

- 将下载的字体文件复制到Flutter项目中

在 pubspec.yaml 中声明字体，基本语法：

```yaml
flutter:
	fonts:
		# family 属性决定了字体的名称，会在 TextStyle 的 fontFamily 属性中用到。
		- family: SourceSansPro
			fonts：
				- assets: fonts/Source_Sans_Pro/SourceSans3-Black.ttf
				- assets: fonts/Source_Sans_Pro/SourceSans3-BlackItalic.ttf
					# weight 属性指定了文件中字体轮廓的字重为 100 的整数倍
					weight: 400
					# style 属性指定了文件中字体的轮廓是否为 italic 或 normal
					style: normal
```

### Icon（图标）

Icon图标也是由Material Desgin icon图标库提供

使用方式：

- Icon(Icons.具体名称)

  ```dart
  Icon(Icons.menu)
  ```

项目中自动给我们集成了Material Desgin的Icon图标库，所以无需额外的下载或配置

### Color（颜色）

Flutter 中通过 ARGB 来来声明颜色。

自定义颜色，下面是自定义颜色的方式：

- const Color(0xFF42A5F5); // 16进制(0x)的ARGB = 透明度(FF) + 六位十六进制颜色值(42A5F5)
- const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5)
- const Color.fromARGB(255, 66, 165, 245)
- const Color.fromRGBO(66, 165, 245, 1.0) // O = Opacity

Colors 英文字母声明的颜色：

- Colors.red

```dart
RichText(
    text: TextSpan(
        text: "Hello",
        style: const TextStyle(fontSize: 40, color: Color.fromRGBO(255, 0, 0, 1)),
        children: [
          TextSpan(
            text: "Flutter",
            style: TextStyle(fontSize: 40, color: Colors.blue),
          ),
          const TextSpan(
            text: "你好世界",
            style: TextStyle(fontSize: 30, color: Color.fromARGB(0xff, 0x00, 0xff, 0x00)),
          )
        ]
    )
)
```

### Container（布局容器）

chlid 声明子组件

padding（margin）

- EdgeInsets （all(), fromLTRB(), only()）

decoration

- BoxDecoration (边框，圆角，渐变，阴影，背景色，背景图片)

alignment

- Alignment （内容对齐）

transform

- Matrix4 （平移-translate，旋转-rotate，缩放-scale，斜切-skew）

```dart
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // width: double.infinity, // 占满父容器宽度
      // height: double.infinity, // 占满父容器高度
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 30, 0, 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 10),
        // border: Border(
        //   top: BorderSide(color: Colors.red, width: 10),
        //   bottom: BorderSide(color: Colors.red, width: 10),
        //   left: BorderSide(color: Colors.red, width: 10),
        //   right: BorderSide(color: Colors.red, width: 10),
        // ),
        // borderRadius必须在boder颜色均匀(四边颜色一直)时才会生效
        // borderRadius: BorderRadius.all(Radius.circular(10)),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30)
        ),
        color: Colors.lightGreen[100],
        gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.white12]), // 设置了渐变之后，背景色color会失效
      ),
      alignment: Alignment.center,
      // transform: Matrix4.translationValues(100, 0, 0), // 平移
      // transform: Matrix4.rotationZ(-0.1), // 旋转
      transform: Matrix4.skewX(0.2), // 斜切
      child: const Text(
        "我们在 YouTube 上有一个 Flutter 频道，欢迎订阅！更多视频和播放列表介绍，以及社区制作的视频教程，可以查看我们的 Flutter 技术视频资源 页面。",
        style: TextStyle(fontSize: 20),
      )
    );
  }
}
```

### Column & Row（线性布局）

Column

Column 中的主轴方向是垂直方向

- mainAxisAlignment：MainAxisAlignment 主轴对齐方式
- crossAxisAlignment：CrossAxisAlignment 交叉轴对齐方式
- children：内容

Row

Row中主轴方向是水平方向

- 属性与Column一致

```dart
class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.lightGreen,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴的对齐方式
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.access_alarm, size: 50),
          Icon(Icons.accessible_forward_outlined, size: 50),
          Icon(Icons.settings, size: 50),
          Icon(Icons.add_box, size: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_alarm, size: 50),
              Icon(Icons.accessible_forward_outlined, size: 50),
              Icon(Icons.settings, size: 50),
              Icon(Icons.add_box, size: 50),
            ],
          )
        ],
      ),
    );
  }
}
```

### Flex & Expanded（弹性布局）

Flex

- direction 声明主轴方向
- mainAxisAlignment 声明主轴对齐方式
- textDirection 声明水平方向的排列顺序
- crossAxisAlignment 声明交叉轴对齐方式
- verticalDirection 声明垂直方向的排列顺序
- children 声明子组件

Expanded 可伸缩组件

- flex 声明弹性布局所占比例
- child 声明子组件

```dart
class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 验证Expanded
        Row(
          children: [
            Container(
              color: Colors.lightBlue,
              width: 50,
              height: 50,
            ),
            Expanded(
                child: Container(
              color: Colors.lightGreen,
              height: 50,
            ))
          ],
        ),
        const Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          textDirection: TextDirection.rtl, // 声明水平方向排列方式
          children: [
            Icon(Icons.access_alarm, size: 50),
            Icon(Icons.accessible_forward_outlined, size: 50),
            Icon(Icons.settings, size: 50),
            Icon(Icons.add_box, size: 50),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Container(
                color: Colors.tealAccent,
                height: 50,
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                color: Colors.amberAccent,
                height: 50,
              ),
              flex: 1,
            )
          ],
        ),
        Container(
          height: 100,
          margin: EdgeInsets.all(50),
          child: Flex(
            direction: Axis.vertical,
            // verticalDirection: VerticalDirection.up, // 垂直方向排列顺序
            children: [
              Expanded(
                child: Container(
                  color: Colors.tealAccent,
                  height: 50,
                ),
                flex: 2,
              ),
              // 空行占位
              Spacer(
                flex: 1,
              ),
              Expanded(
                child: Container(
                  color: Colors.amberAccent,
                  height: 50,
                ),
                flex: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}
```

### Wrap (流式布局)

Wrap（解决内容溢出的问题）

- spacing 主轴方向子组件的间距
- alignment 主轴方向的对齐方式
- runSpacing 纵轴方向子组件的间距
- runAlignment 纵轴方向的对齐方式

顺带学的小组件：Chip（标签），CircleAvatar（圆形头像）

```dart
class WrapDemo extends StatelessWidget {
  const WrapDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> _list = [
      '曹操', '司马懿', '曹仁', '曹洪', '张辽', '许诸'
    ];

    List<Chip> _weiGuo() {
      return _list.map((item){
        return Chip(
          avatar: const CircleAvatar(
            backgroundColor: Colors.black,
            child: Text("魏", style: TextStyle(fontSize: 12, color: Colors.white),),
          ),
          label: Text(item),
        );
      }).toList();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          spacing: 18, // 水平间距
          runSpacing: 15, // 垂直间距
          alignment: WrapAlignment.spaceAround, // 主轴对齐方式
          // runAlignment: WrapAlignment.spaceAround, // 交叉轴对齐方式【已经在column里了，效果不是很明显】
          children: _weiGuo(),
        ),
        const Wrap(
          children: [
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("刘备"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("张飞"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("关羽"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("赵云"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("诸葛亮"),
            ),
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("蜀"),
              ),
              label: Text("黄忠"),
            )
          ],
        )
      ],
    );
  }
}
```

### Stack（层叠布局）

Stack 层叠组件 - 类似css中的 z-index

- alignment 声明未定位子组件的对齐方式
- textDirection 声明未定位子组件的排列顺序

Positioned 绝对定位组件

- child 声明子组件
- left，top，right，bottom
- width，height

顺带学的组件：NetworkImage 网络图片组件

- NetworkImage('网络图片地址')
- 配置网络权限: `<uses-permission android:name="android.permission.INTERNET"/>`

```dart
class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        // 声明未定位子组件排序方式
        textDirection: TextDirection.rtl,
        // 声明未定位子组件对齐方式
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://himg.bdimg.com/sys/portrait/item/public.1.f02d5419.4lnYMc1vGvDDmM9ZRgs5JQ.jpg'),
            radius: 200,
          ),
          Positioned(
            top: 50,
            right: 40,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: const Text(
                '热卖',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const Text(
            'Hello',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ],
      ),
    );
  }
}
```

### Card（卡片）

Card 卡片

- child 子组件
- color 背景色
- shadowColor 阴影色
- elevation 阴影高度
- shape 边框样式
- margin 外边距

ListTile 列表瓦片

- leading 头部组件
- title 标题
- subtitle 子标题

```dart
class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(30),
          color: Colors.purpleAccent[100],
          shadowColor: Colors.yellow,
          elevation: 20,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Colors.yellow, width: 3)),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.supervised_user_circle, size: 50),
                title: Text(
                  "张三",
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  "董事长",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "电话: 13333333333",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "地址:xxxxxxxx",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.supervised_user_circle, size: 50),
                title: Text(
                  "李四",
                  style: TextStyle(fontSize: 30),
                ),
                subtitle: Text(
                  "总经理",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "电话: 13333333333",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(
                  "地址:xxxxxxxx",
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
```

### Button（按钮）

```dart
import 'package:flutter/material.dart';

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
      body: const ButtonDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: "Increment",
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Wrap(
        children: [
          TextButton(
              onPressed: () {
                print('点击 TextButton');
              },
              onLongPress: () {
                print('长按 TextButton');
              },
              child: const Text('TextButton')),
          ElevatedButton(
              onPressed: () {
                print('点击 ElevatedButton');
              },
              onLongPress: () {
                print('长按 ElevatedButton');
              },
              child: const Text('ElevatedButton')),
          OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              child: const Text('OutlinedButton')),
          OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              style: ButtonStyle(
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    // 按下按钮时的前景色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.red;
                    }
                    return Colors.blue;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    // 按下按钮时的前景色
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.yellow;
                    }
                    return Colors.white;
                  }),
                  shadowColor: MaterialStateProperty.all(Colors.yellow),
                  elevation: MaterialStateProperty.all(20),
                  // 边框
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.green, width: 2)),
                  // 按钮形状
                  shape: MaterialStateProperty.all(const StadiumBorder(
                      side: BorderSide(color: Colors.green, width: 2))),
                  // 按钮大小
                  maximumSize: MaterialStateProperty.all(const Size(180, 90)),
                  // 水波纹效果
                  overlayColor: MaterialStateProperty.all(Colors.purple)),
              child: const Text('轮廓按钮')),
          OutlinedButtonTheme(
            data: OutlinedButtonThemeData(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.red))),
            child: OutlinedButton(
              onPressed: () {
                print('点击 OutlinedButton');
              },
              onLongPress: () {
                print('长按 OutlinedButton');
              },
              style: ButtonStyle(
                  // 样式中声明的样式如果和主题中重复，则主题中的不生效
                  overlayColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('OutlinedButton'),
            ),
          ),
          // 图标按钮
          IconButton(
              onPressed: () {
                print('IconButton');
              },
              color: Colors.red,
              splashColor: Colors.lightBlue,
              highlightColor: Colors.purple,
              tooltip: "怎么了", // 长按会出现
              icon: Icon(Icons.add_alarm)),
          TextButton.icon(
              onPressed: () {
                print('文本按钮 icon');
              },
              icon: Icon(Icons.add_circle),
              label: Text("文本按钮")),
          ElevatedButton.icon(
              onPressed: () {
                print('凸起按钮 icon');
              },
              icon: Icon(Icons.add_circle),
              label: Text("凸起按钮")),
          OutlinedButton.icon(
              onPressed: () {
                print('轮廓按钮 icon');
              },
              icon: Icon(Icons.add_circle),
              label: Text("轮廓按钮")),
          // 按钮组
          Container(
            color: Colors.pink,
            width: double.infinity,
            // 按钮默认横向排列，当按钮显示不下时，会垂直排列
            child: ButtonBar(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: Text("按钮一")),
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: Text("按钮一")),
                ElevatedButton(
                    onPressed: () {
                      print("按钮一");
                    },
                    child: Text("按钮一")),
              ],
            ),
          ),
          BackButton(
            color: Colors.red,
            onPressed: () {
              print("回退按钮");
            },
          ),
          CloseButton(
            color: Colors.red,
            onPressed: () {
              print("关闭按钮");
            },
          )
        ],
      ),
    );
  }
}
```

### Image（图片）

Image.asset 加载本地图片

- 项目下创建一个图片存储目录
- 在 pubspec.yaml 中的 flutter 部分添加图片配置
- 在代码中加载图片

Image.network 加载网络图片

- 设置网络访问权限
- 允许http协议访问（默认只允许https）

```dart
class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/bg1.jpg',
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://himg.bdimg.com/sys/portrait/item/public.1.f02d5419.4lnYMc1vGvDDmM9ZRgs5JQ.jpg',
          repeat: ImageRepeat.repeat,
          color: Colors.green,
          colorBlendMode: BlendMode.colorDodge,
        )
      ],
    );
  }
}
```

### SingleChildScrollView（列表）

child 子组件

padding 内边距

scrollDirection 滚动方向：Axis.horizontal | Axis.vertical

reverse 初始滚动位置，false 头部 | true 尾部

physics：

- ClampingScrollPhysics：Android 下微光效果
- BouncingScrollPhysics：IOS下弹性效果

```dart
class SingleChildScrollViewDemo extends StatelessWidget {
  const SingleChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 验证水平滚动
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          reverse: true,
          child: Row(
            children: [
              OutlinedButton(onPressed: () {}, child: Text("按钮一")),
              OutlinedButton(onPressed: () {}, child: Text("按钮二")),
              OutlinedButton(onPressed: () {}, child: Text("按钮三")),
              OutlinedButton(onPressed: () {}, child: Text("按钮四")),
              OutlinedButton(onPressed: () {}, child: Text("按钮五")),
              OutlinedButton(onPressed: () {}, child: Text("按钮六")),
            ],
          ),
        ),
        // 垂直方向
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
          reverse: false,
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(100, (index) => OutlinedButton(onPressed: () {}, child: Text("按钮$index")))
          ),
        )
      ],
    );
  }
}
```

### ListView（列表）

ListView

- 加载列表组件（加载所有Widgets，使用Widgets比较少的场景）
- ListTitle（leading，title，subtitle，trailing，selected）

ListView.builder

- 按需加载Widget，性能比默认构造函数要高，使用Widget较多的场景

ListView.separated

- 比 ListVIew.builder 多了分隔器

```dart
import 'package:flutter/material.dart';

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
      body: const ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ListViewBasic(),
          const ListViewHorizontal(),
          ListViewBuilderDemo(),
          ListViewSeperatedDemo()
        ],
      ),
    );
  }
}

class ListViewBasic extends StatelessWidget {
  const ListViewBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              size: 50,
            ),
            title: Text("access_alarm"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.add_a_photo_outlined,
              size: 50,
            ),
            title: Text("add_a_photo_outlined"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
            selected: true,
            selectedColor: Colors.red,
            selectedTileColor: Colors.lightBlue,
          ),
          ListTile(
            leading: Icon(
              Icons.ac_unit,
              size: 50,
            ),
            title: Text("ac_unit"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            leading: Icon(
              Icons.fact_check_outlined,
              size: 50,
            ),
            title: Text("fact_check_outlined"),
            subtitle: Text("子标题"),
            trailing: Icon(Icons.keyboard_arrow_right),
          )
        ],
      ),
    );
  }
}

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160,
            color: Colors.amber,
          ),
          Container(
            width: 160,
            color: Colors.black,
          ),
          Container(
            width: 160,
            color: Colors.blue,
          ),
          Container(
            width: 160,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  ListViewBuilderDemo({super.key});

  final List<Widget> users = List<Widget>.generate(20,
      (index) => OutlinedButton(onPressed: () {}, child: Text("姓名 $index")));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: users.length,
        itemExtent: 30,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return users[index];
        },
      ),
    );
  }
}

class ListViewSeperatedDemo extends StatelessWidget {
  ListViewSeperatedDemo({super.key});

  final List<Widget> products = List.generate(
      20,
      (index) => ListTile(
            leading: Image.asset('images/flutter.jpg'),
            title: Text("商品标题 $index"),
            subtitle: const Text("子标题"),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text("商品列表"),
        ),
        Container(
          height: 200,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return products[index];
              },
              // 分隔器的构造器
              separatorBuilder: (context, index) {
                return Divider(
                  color: index % 2 == 0 ? Colors.blue : Colors.red,
                  thickness: 2,
                );
              },
              itemCount: products.length),
        )
      ],
    );
  }
}
```

### GridView（列表）

GirView

- children 子组件

- scrollDirection 滚动方向

- gridDelegate
  - SliverGridDelegateWidthFixedCrossAxisCount 指定列数 - 子组件宽度自适应
  - SliverGridDelegateWidthMaxCorssAxisExtent 指定子组件宽度 - 列数自适应

```dart
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      // GridView(
      //   padding: const EdgeInsets.all(20),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: 20, // 主轴方向的边距
      //     crossAxisSpacing: 20, // 交叉轴边距
      //     childAspectRatio: 1.5 // 子组件宽高比例
      //   ),
      //   children: [
      //     Container(color: Colors.black),
      //     Container(color: Colors.orange),
      //     Container(color: Colors.blue),
      //     Container(color: Colors.red),
      //     Container(color: Colors.green),
      //     Container(color: Colors.grey),
      //     Container(color: Colors.purple),
      //     Container(color: Colors.yellow),
      //     Container(color: Colors.brown),
      //     Container(color: Colors.teal),
      //   ],
      // ),
      GridView(
        padding: const EdgeInsets.all(20),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 190, // 子组件宽度
          mainAxisSpacing: 20, // 主轴方向的边距
          crossAxisSpacing: 20, // 交叉轴边距
          childAspectRatio: 0.8
        ),
        children: [
          Container(color: Colors.black),
          Container(color: Colors.orange),
          Container(color: Colors.blue),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.grey),
          Container(color: Colors.purple),
          Container(color: Colors.yellow),
          Container(color: Colors.brown),
          Container(color: Colors.teal),
        ],
      ),
    );
  }
}
```

**GridView命名构造函数用法：**

GridView.count 列数固定

GridView.extend 子组件宽度固定

GridView.builder 动态网格布局

- ScrollPhysics physics 确定可滚动控件的物理特性
  - BouncingScrollPhysics 允许超出边界 - 反弹效果
  - ClampingScrollPhysics 防止超出边界 - 夹住效果
  - AlwaysScrollableScrollPhysics 始终响应滚动
  - NeverScrollableScrollPhysics 不响应滚动

```dart
import 'package:flutter/material.dart';

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
      // body: const GridViewCountDemo(),
      // body: const GridViewExtendDemo(),
      body: GridViewBuilderDemo(),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2, // 几列
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        childAspectRatio: 1.5,
        children:
            List.generate(10, (index) => Image.asset('images/flutter.jpg')),
      ),
    );
  }
}

class GridViewExtendDemo extends StatelessWidget {
  const GridViewExtendDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 100, // 子组件宽度
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        children:
            List.generate(10, (index) => Image.asset('images/flutter.jpg')),
      ),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  GridViewBuilderDemo({super.key});

  final List<dynamic> _tiles = [
    Container(color: Colors.black),
    Container(color: Colors.orange),
    Container(color: Colors.blue),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.grey),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
    Container(color: Colors.brown),
    Container(color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.0),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        itemCount: _tiles.length,
        itemBuilder: (context, index) {
          return _tiles[index];
        },
        physics: BouncingScrollPhysics(), // 反弹效果
        // physics: ClampingScrollPhysics(), // 夹住效果
        // physics: AlwaysScrollableScrollPhysics(), // 滚动
        // physics: NeverScrollableScrollPhysics(), // 禁止滚动
      ),
    );
  }
}
```

### 其他

#### Cupertino（IOS风格）

- IOS风格组件
- import "package:flutter/cupertion.dart"

```dart
class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final Widget dialogBox;
    // // 判断当前的平台信息
    // if (Platform.isIOS) {
    //   // 加载IOS风格
    //   dialogBox = CupertinoDemo();
    // } else if (Platform.isAndroid) {
    //   // 加载android风格
    //   dialogBox = MaterialDemo();
    // }

    return Container(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 安卓风格组件
          Text('material 安卓风格'),
          MaterialDemo(),
          // IOS风格组件
          Text('Cupertino IOS风格'),
          CupertinoDemo()
        ],
      ),
    );
  }
}

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          TextButton(
              onPressed: () {
                print("取消的逻辑");
              },
              child: const Text("取消")),
          TextButton(
              onPressed: () {
                print("确认的逻辑");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: const Text("提示"),
        content: const Text("确认删除吗？"),
        actions: [
          CupertinoDialogAction(
              onPressed: () {
                print("取消的逻辑");
              },
              child: const Text("取消")),
          CupertinoDialogAction(
              onPressed: () {
                print("确认的逻辑");
              },
              child: const Text("确认"))
        ],
      ),
    );
  }
}
```

## 第三方组件

1. 去[pub.dev](https://pub.dev/)种搜索
2. 在 pubspec.yaml 种配置

### dio（Http请求）

*相当于flutter版的axios*

```dart
class DioDemo extends StatelessWidget {
  const DioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("点击发送请求"),
        onPressed: () {
          getIpAddress();
        },
      ),
    );
  }

  void getIpAddress() async {
    try {
      const url = 'https://httpbin.org/ip';
      Response response = await Dio().get(url);
      String ip = response.data['origin'];
      print(ip);
    } catch (e) {
      print(e);
    }
  }
}
```



### flutter_swiper（轮播）

*flutter中的轮播组件*

*flutter_swiper不支持 sdk3.x，可以使用 flutter_swiper_view*

```dart
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
```

### shared_preferences（本地存储）

*相当于web端的localStorage*

使用：SharedPreference perfs = await SharedPreference.getInstance();

基本操作,以String类型举例，其他类型基本一致，比如setString | setBool | setInt

- 增 setString(key, value)
- 删
  - remove(key)
  - clear() 清空
- 改
  - 更改就是重新设置数据，所以使用 setString(key, value) 即可
- 查 getString(key)

```dart
class ShartPerferencesDemo extends StatelessWidget {
  const ShartPerferencesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _incrementCounter, child: const Text('递增')),
          ElevatedButton(onPressed: _decrementCounter, child: const Text('递减')),
          ElevatedButton(onPressed: _removeCounter, child: const Text('删除')),
          ElevatedButton(onPressed: _addMyContent, child: const Text('设置字符串')),
          ElevatedButton(onPressed: _getMyContent, child: const Text('获取字符串')),
          ElevatedButton(onPressed: _clearContent, child: const Text('清空')),
        ],
      ),
    );
  }

  _incrementCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressd Counter is $counter');
    await prefs.setInt('counter', counter);
  }

  _decrementCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt('counter') ?? 0;
    if (counter > 0) {
      counter--;
    }
    print('Pressd Counter is $counter');
    await prefs.setInt('counter', counter);
  }

  _removeCounter() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('counter');
    int counter = prefs.getInt('counter') ?? 0;
    print('Pressd Counter is $counter');
  }

  _addMyContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('hi', 'hello world');
    String content = prefs.getString('hi') ?? '';
    print('set string content is $content');
  }

  _getMyContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String content = prefs.getString('hi') ?? '';
    print('get string content is $content');
  }

  _clearContent() async {
    // 获取SharedPreferences实例
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
```

## 状态管理

Flutter中的组件，按状态划分：

- StatelessWidget 无状态组件
- StatefulWidget 状态组件

按状态作用域划分

- 组件内私有状态 （statefulWidget）
- 跨组件状态共享（InheritedWidget，Provider）
- 全局状态（Redux | fish-redux(咸鱼团队退出)，Mobx）

状态组件的组成

- StatefulWidget （组件本身不可变 - @immutable）
- State（将变化的状态放到State中维护）

### StatefulWidget（状态组件）

```dart
class MyState extends StatefulWidget {
  const MyState({super.key});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  int _num = 0;
  void _increment() {
    setState(() {
      _num++;
    });
  }

  void _decrement() {
    setState(() {
      _num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        ElevatedButton(onPressed: _increment, child: Icon(Icons.add)),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text('$_num'),
        ),
        ElevatedButton(onPressed: _decrement, child: Icon(Icons.remove))
      ]),
    );
  }
}
```

### DataTable（表格）

*这个表格中用到了状态管理，所以放到这里来*



### InheritedWidget

*这个组件可以实现跨组件分享功能*



### 生命周期



### Provider



