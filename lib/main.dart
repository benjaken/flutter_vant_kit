import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_kit/widgets/page_scaffold.dart';
import 'routes/index.dart';

void main() async {
  runApp(MyApp());
  PaintingBinding.instance.imageCache.maximumSize = 2000; //最多2000张
  PaintingBinding.instance.imageCache.maximumSizeBytes = 200 << 20; //200 M
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Flutter 组件库"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            ExpansionTile(
              title: Text('基础组件'),
              children: _generateItem(context, [
                PageInfo("Button 按钮", (ctx) => demoButton(), padding: false),
                PageInfo("Cell 单元格", (ctx) => demoCell(), padding: false),
                PageInfo("Image 图片", (ctx) => demoImage(), padding: true),
              ])
            ),
            ExpansionTile(
              title: Text('表单组件'),
              children: _generateItem(context, [
                PageInfo("Checkbox 复选框", (ctx) => demoCheckbox(), padding: true),
                PageInfo("Field 输入框", (ctx) => demoField(), padding: false),
                PageInfo("NumberKeyboard 数字键盘", (ctx) => demoNumberKeyboard(), padding: true),
                PageInfo("PasswordInput 密码输入框", (ctx) => demoPasswordInput(), padding: true),
                PageInfo("Radio 单选框", (ctx) => demoRadio(), padding: true),
                PageInfo("Rate 评分", (ctx) => demoRate(), padding: false),
                PageInfo("Search 搜索", (ctx) => demoSearch(), padding: false),
                PageInfo("Stepper 步进器", (ctx) => demoStepper(), padding: false),
                PageInfo("ImageWall 图片选择器", (ctx) => demoImageWall(), padding: false),
              ]),
            ),
            ExpansionTile(
              title: Text("反馈组件"),
              children: _generateItem(context, [
                PageInfo("ActionSheet 上拉菜单", (ctx) => demoActionSheet(), padding: true),
                PageInfo("Dialog 弹窗", (ctx) => demoDialog(), padding: true),
                PageInfo("Loading 加载", (ctx) => demoLoading(), padding: true),
              ]),
            ),
            ExpansionTile(
              title: Text('展示组件'),
              children: _generateItem(context, [
                PageInfo("Badge 徽标", (ctx) => demoBadge(), padding: true),
                PageInfo("Circle 环形进度条", (ctx) => demoCircle(), padding: true),
                // PageInfo("CountDown 倒计时", (ctx) => demoCountDown(), padding: false),
                PageInfo("Divider 分割线", (ctx) => demoDivider(), padding: true),
                PageInfo("ImagePreview 图片预览", (ctx) => demoImagePreview(), padding: true),
                PageInfo("List 列表", (ctx) => demoList(), padding: false, withScaffold: false),
                PageInfo("NoticeBar 通知栏", (ctx) => demoNoticeBar(), padding: false),
                PageInfo("Panel 面板", (ctx) => demoPanel(), padding: false),
                PageInfo("Progress 进度条", (ctx) => demoProgress(), padding: true),
                PageInfo("Skeleton 骨架屏", (ctx) => demoSkeleton(), padding: true),
                PageInfo("Steps 步骤条", (ctx) => demoSteps(), padding: false),
                PageInfo("Swipe 轮播", (ctx) => demoSwipe(), padding: false),
                PageInfo("Tag 标签", (ctx) => demoTag(), padding: true),
              ])
            ),
            ExpansionTile(
              title: Text("导航组件"),
              children: _generateItem(context, [
                PageInfo("Pagination 分页", (ctx) => demoPagination(), padding: true),
                PageInfo("Sidebar 侧边导航", (ctx) => demoSidebar(), padding: true),
                PageInfo("TreeSelect 分类选择", (ctx) => demoTreeSelect(), padding: false),
              ]),
            ),
            ExpansionTile(
              title: Text("业务组件"),
              children: _generateItem(context, [
                PageInfo("AddressEdit 地址编辑", (ctx) => demoAddressEdit(), padding: true),
                PageInfo("AddressList 地址列表", (ctx) => demoAddressList(), padding: false),
                PageInfo("Card 商品卡片", (ctx) => demoCard(), padding: true),
                PageInfo("Coupon 优惠券选择器", (ctx) => demoCoupon(), padding: false),
                PageInfo("GoodsAction 商品导航", (ctx) => demoGoodsAction(), padding: false),
                PageInfo("SubmitBar 提交订单栏", (ctx) => demoSubmitBar(), padding: false),
              ]),
            ),
          ],
        )
      );
  }
}
