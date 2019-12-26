import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_kit/routes/index.dart';
import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';
import 'package:flutter_kit/widgets/collapse.dart';
import 'package:flutter_kit/widgets/collapseItem.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      title: 'Flutter 组件库',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter 组件库"),
        centerTitle: true,
      ),
      body: Collapse(
        name: ["0", "1", "2", "3", "4", "5"],
        list: [
          CollapseItem(
            customTitle:
                Text("基础组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("Button 按钮", (ctx) => demoButton(), padding: false),
                PageCell("Cell 单元格", (ctx) => demoCell(), padding: false),
                PageCell("Image 图片", (ctx) => demoImage(), padding: true),
                PageCell("Avatar 头像", (ctx) => demoAvatar(), padding: true),
              ],
            ),
          ),
          CollapseItem(
            customTitle: Text("表单组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("Checkbox 复选框", (ctx) => demoCheckbox(),
                    padding: true),
                PageCell("Field 输入框", (ctx) => demoField(), padding: false),
                PageCell("NumberKeyboard 数字键盘", (ctx) => demoNumberKeyboard(),
                    padding: true),
                PageCell("PasswordInput 密码输入框", (ctx) => demoPasswordInput(),
                    padding: true),
                PageCell("Radio 单选框", (ctx) => demoRadio(), padding: true),
                PageCell("Rate 评分", (ctx) => demoRate(), padding: false),
                PageCell("Search 搜索", (ctx) => demoSearch(), padding: false),
                PageCell("Stepper 步进器", (ctx) => demoStepper(), padding: false),
                PageCell("ImageWall 图片选择器", (ctx) => demoImageWall(),
                    padding: false),
              ],
            ),
          ),
          CollapseItem(
            customTitle:
                Text("反馈组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("ActionSheet 上拉菜单", (ctx) => demoActionSheet(),
                    padding: true),
                PageCell("Dialog 弹窗", (ctx) => demoDialog(), padding: true),
                PageCell("Loading 加载", (ctx) => demoLoading(), padding: true),
              ],
            ),
          ),
          CollapseItem(
            customTitle:
                Text("展示组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("Badge 徽标", (ctx) => demoBadge(), padding: true),
                PageCell("Circle 环形进度条", (ctx) => demoCircle(), padding: true),
                PageCell("Collapse 折叠面板", (ctx) => demoCollapse(),
                    padding: false),
                // PageCell("CountDown 倒计时", (ctx) => demoCountDown(), padding: false),
                PageCell("Divider 分割线", (ctx) => demoDivider(), padding: true),
                PageCell("ImagePreview 图片预览", (ctx) => demoImagePreview(),
                    padding: true),
                PageCell("List 列表", (ctx) => demoList(),
                    padding: false, withScaffold: false),
                PageCell("NoticeBar 通知栏", (ctx) => demoNoticeBar(),
                    padding: false),
                PageCell("Panel 面板", (ctx) => demoPanel(), padding: false),
                PageCell("Price 商品价格", (ctx) => demoPrice(), padding: true),
                PageCell("Progress 进度条", (ctx) => demoProgress(),
                    padding: true),
                PageCell("Skeleton 骨架屏", (ctx) => demoSkeleton(),
                    padding: true),
                PageCell("Steps 步骤条", (ctx) => demoSteps(), padding: false),
                PageCell("Swipe 轮播", (ctx) => demoSwipe(), padding: false),
                PageCell("Tag 标签", (ctx) => demoTag(), padding: true),
              ],
            ),
          ),
          CollapseItem(
            customTitle:
                Text("导航组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("Pagination 分页", (ctx) => demoPagination(),
                    padding: true),
                PageCell("Sidebar 侧边导航", (ctx) => demoSidebar(), padding: true),
                PageCell("TreeSelect 分类选择", (ctx) => demoTreeSelect(),
                    padding: false),
              ],
            ),
          ),
          CollapseItem(
            customTitle:
                Text("业务组件", style: TextStyle(fontWeight: FontWeight.bold)),
            isExpanded: true,
            child: CellGroup(
              border: false,
              children: <Widget>[
                PageCell("AddressEdit 地址编辑", (ctx) => demoAddressEdit(),
                    padding: false),
                PageCell("AddressList 地址列表", (ctx) => demoAddressList(),
                    padding: false),
                PageCell("Card 商品卡片", (ctx) => demoCard(), padding: false),
                PageCell("Coupon 优惠券选择器", (ctx) => demoCoupon(),
                    padding: false),
                PageCell("GoodsAction 商品导航", (ctx) => demoGoodsAction(),
                    padding: false),
                PageCell("SubmitBar 提交订单栏", (ctx) => demoSubmitBar(),
                    padding: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageCell extends StatelessWidget {
  PageCell(
    this.title,
    this.builder, {
    this.withScaffold = true,
    this.padding = true,
  });

  String title;
  WidgetBuilder builder;
  bool withScaffold;
  bool padding;

  void _openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!withScaffold) {
        return builder(context);
      }
      return PageScaffold(title: title, body: builder(context), padding: padding);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Cell(
      title: title,
      isLink: true,
      onClick: () => _openPage(context),
    );
  }
}

class PageScaffold extends StatelessWidget {
  PageScaffold({
    this.title, 
    this.body, 
    this.padding: false
  });

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: padding
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            )
          : body,
    );
  }
}
