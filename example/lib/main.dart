import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './routes/index.dart';
import 'package:flutter_vant_kit/main.dart';

void main() async {
  runApp(MyApp());
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
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Collapse(
            name: ["0"],
            list: [
              CollapseItem(
                customTitle:
                    Text("基础组件", style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Button 按钮", (ctx) => DemoButton(),
                        padding: false),
                    PageCell("Cell 单元格", (ctx) => DemoCell(), padding: false),
                    PageCell("Image 图片", (ctx) => DemoImage(), padding: true),
                    PageCell("Avatar 头像", (ctx) => DemoAvatar(), padding: true),
                  ],
                ),
              ),
              CollapseItem(
                customTitle:
                    Text("表单组件", style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Checkbox 复选框", (ctx) => DemoCheckbox(),
                        padding: true),
                    PageCell("Field 输入框", (ctx) => DemoField(), padding: false),
                    PageCell(
                        "NumberKeyboard 数字键盘", (ctx) => DemoNumberKeyboard(),
                        padding: true),
                    PageCell(
                        "PasswordInput 密码输入框", (ctx) => DemoPasswordInput(),
                        padding: true),
                    PageCell("Radio 单选框", (ctx) => DemoRadio(), padding: true),
                    PageCell("Rate 评分", (ctx) => DemoRate(), padding: false),
                    PageCell("Search 搜索", (ctx) => DemoSearch(),
                        padding: false),
                    PageCell("Stepper 步进器", (ctx) => DemoStepper(),
                        padding: false),
                    PageCell("ImageWall 图片选择器", (ctx) => DemoImageWall(),
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
                    PageCell("ActionSheet 上拉菜单", (ctx) => DemoActionSheet(),
                        padding: true),
                    PageCell("Dialog 弹窗", (ctx) => DemoDialog(), padding: true),
                    PageCell("Loading 加载", (ctx) => DemoLoading(),
                        padding: true),
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
                    PageCell("Badge 徽标", (ctx) => DemoBadge(), padding: true),
                    PageCell("Circle 环形进度条", (ctx) => DemoCircle(),
                        padding: true),
                    PageCell("Collapse 折叠面板", (ctx) => DemoCollapse(),
                        padding: false),
                    // PageCell("CountDown 倒计时", (ctx) => DemoCountDown(), padding: false),
                    PageCell("Divider 分割线", (ctx) => DemoDivider(),
                        padding: true),
                    PageCell("ImagePreview 图片预览", (ctx) => DemoImagePreview(),
                        padding: true),
                    PageCell("List 列表", (ctx) => DemoList(),
                        padding: false, withScaffold: false),
                    PageCell("NoticeBar 通知栏", (ctx) => DemoNoticeBar(),
                        padding: false),
                    PageCell("Panel 面板", (ctx) => DemoPanel(), padding: false),
                    PageCell("Price 商品价格", (ctx) => DemoPrice(), padding: true),
                    PageCell("Progress 进度条", (ctx) => DemoProgress(),
                        padding: true),
                    PageCell("Skeleton 骨架屏", (ctx) => DemoSkeleton(),
                        padding: true),
                    PageCell("Steps 步骤条", (ctx) => DemoSteps(), padding: false),
                    PageCell("Swipe 轮播", (ctx) => DemoSwipe(), padding: false),
                    PageCell("Tag 标签", (ctx) => DemoTag(), padding: true),
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
                    PageCell("Pagination 分页", (ctx) => DemoPagination(),
                        padding: true),
                    PageCell("Sidebar 侧边导航", (ctx) => DemoSidebar(),
                        padding: true),
                    PageCell("TreeSelect 分类选择", (ctx) => DemoTreeSelect(),
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
                    PageCell("AddressEdit 地址编辑", (ctx) => DemoAddressEdit(),
                        padding: false),
                    PageCell("AddressList 地址列表", (ctx) => DemoAddressList(),
                        padding: false),
                    PageCell("Card 商品卡片", (ctx) => DemoCard(), padding: false),
                    PageCell("Coupon 优惠券选择器", (ctx) => DemoCoupon(),
                        padding: false),
                    PageCell("GoodsAction 商品导航", (ctx) => DemoGoodsAction(),
                        padding: false),
                    PageCell("SubmitBar 提交订单栏", (ctx) => DemoSubmitBar(),
                        padding: false),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  final String title;
  final WidgetBuilder builder;
  final bool withScaffold;
  final bool padding;

  void _openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!withScaffold) {
        return builder(context);
      }
      return PageScaffold(
          title: title, body: builder(context), padding: padding);
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
  PageScaffold({this.title, this.body, this.padding: false});

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: padding
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: body,
                )
              : body,
        ));
  }
}
