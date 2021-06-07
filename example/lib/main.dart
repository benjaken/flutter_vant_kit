import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './routes/index.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './generated/i18n.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final i18n = I18n.delegate;

  @override
  void initState() {
    super.initState();
    I18n.onLocaleChanged = onLocaleChange;
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      I18n.locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vant Kit',
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: i18n.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

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
          title: Text("Flutter Vant Kit"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  String lang = I18n.delegate.getLocale();
                  I18n.onLocaleChanged!(lang == 'zh_CN'
                      ? Locale("en", "US")
                      : Locale("zh", "CN"));
                },
                icon: Icon(Icons.translate_outlined))
          ]),
      body: Container(
        color: Color(0xfff7f8fa),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              CellGroup(
                title: I18n.of(context)!.base_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.base_button_title,
                      (ctx) => DemoButton(),
                      padding: false),
                  PageCell(
                      I18n.of(context)!.base_cell_title, (ctx) => DemoCell(),
                      padding: false),
                  PageCell(
                      I18n.of(context)!.base_image_title, (ctx) => DemoImage(),
                      padding: true),
                  PageCell(I18n.of(context)!.base_avatar_title,
                      (ctx) => DemoAvatar(),
                      padding: true),
                ],
              ),
              CellGroup(
                title: I18n.of(context)!.form_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.form_calendar_title,
                      (ctx) => DemoCalendar(),
                      padding: false),
                  PageCell(I18n.of(context)!.form_checkbox_title,
                      (ctx) => DemoCheckbox(),
                      padding: true),
                  PageCell(
                      I18n.of(context)!.form_field_title, (ctx) => DemoField(),
                      padding: false),
                  PageCell(I18n.of(context)!.form_number_keyboard_title,
                      (ctx) => DemoNumberKeyboard(),
                      padding: true),
                  PageCell(I18n.of(context)!.form_password_input_title,
                      (ctx) => DemoPasswordInput(),
                      padding: true),
                  PageCell(I18n.of(context)!.form_picker_title,
                      (ctx) => DemoPicker(),
                      padding: false),
                  PageCell(
                      I18n.of(context)!.form_radio_title, (ctx) => DemoRadio(),
                      padding: true),
                  PageCell(
                      I18n.of(context)!.form_rate_title, (ctx) => DemoRate(),
                      padding: false),
                  PageCell(I18n.of(context)!.form_search_title,
                      (ctx) => DemoSearch(),
                      padding: false),
                  PageCell(I18n.of(context)!.form_stepper_title,
                      (ctx) => DemoStepper(),
                      padding: false),
                  PageCell(I18n.of(context)!.form_image_wall_title,
                      (ctx) => DemoImageWall(),
                      padding: false),
                ],
              ),
              CellGroup(
                title: I18n.of(context)!.action_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.action_action_sheet_title,
                      (ctx) => DemoActionSheet(),
                      padding: false),
                  PageCell(I18n.of(context)!.action_dialog_title,
                      (ctx) => DemoDialog(),
                      padding: false),
                  PageCell(I18n.of(context)!.action_loading_title,
                      (ctx) => DemoLoading(),
                      padding: true),
                  PageCell(I18n.of(context)!.action_share_sheet_title,
                      (ctx) => DemoShareSheet(),
                      padding: false),
                ],
              ),
              CellGroup(
                title: I18n.of(context)!.display_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.display_badge_title,
                      (ctx) => DemoBadge(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_circle_title,
                      (ctx) => DemoCircle(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_collapse_title,
                      (ctx) => DemoCollapse(),
                      padding: false),
                  PageCell(I18n.of(context)!.display_divider_title,
                      (ctx) => DemoDivider(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_image_preview_title,
                      (ctx) => DemoImagePreview(),
                      padding: false),
                  PageCell(
                      I18n.of(context)!.display_list_title, (ctx) => DemoList(),
                      padding: false, withScaffold: false),
                  PageCell(I18n.of(context)!.display_notice_bar_title,
                      (ctx) => DemoNoticeBar(),
                      padding: false),
                  PageCell(I18n.of(context)!.display_panel_title,
                      (ctx) => DemoPanel(),
                      padding: false),
                  PageCell(I18n.of(context)!.display_price_title,
                      (ctx) => DemoPrice(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_progress_title,
                      (ctx) => DemoProgress(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_skeleton_title,
                      (ctx) => DemoSkeleton(),
                      padding: true),
                  PageCell(I18n.of(context)!.display_steps_title,
                      (ctx) => DemoSteps(),
                      padding: false),
                  PageCell(I18n.of(context)!.display_swipe_title,
                      (ctx) => DemoSwipe(),
                      padding: false),
                  PageCell(
                      I18n.of(context)!.display_tag_title, (ctx) => DemoTag(),
                      padding: true),
                ],
              ),
              CellGroup(
                title: I18n.of(context)!.navigation_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.navigation_pagination_title,
                      (ctx) => DemoPagination(),
                      padding: true),
                  PageCell(I18n.of(context)!.navigation_sidebar_title,
                      (ctx) => DemoSidebar(),
                      padding: true),
                  PageCell(I18n.of(context)!.navigation_tree_select_title,
                      (ctx) => DemoTreeSelect(),
                      padding: false),
                ],
              ),
              CellGroup(
                title: I18n.of(context)!.business_title,
                border: false,
                children: <Widget>[
                  PageCell(I18n.of(context)!.business_address_edit_title,
                      (ctx) => DemoAddressEdit(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_address_list_title,
                      (ctx) => DemoAddressList(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_card_title,
                      (ctx) => DemoCard(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_contact_card_title,
                      (ctx) => DemoContactCard(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_coupon_title,
                      (ctx) => DemoCoupon(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_goods_action_title,
                      (ctx) => DemoGoodsAction(),
                      padding: false),
                  PageCell(I18n.of(context)!.business_submit_bar_title,
                      (ctx) => DemoSubmitBar(),
                      padding: false),
                ],
              )
            ],
          ),
        )),
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

  final String? title;
  final Widget? body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(padding ? 16.0 : 0),
                decoration: BoxDecoration(
                  color: Color(0xfff7f8fa),
                ),
                child: body)));
  }
}
