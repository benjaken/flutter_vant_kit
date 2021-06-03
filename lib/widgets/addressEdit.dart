import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vant_kit/theme/style.dart';
import 'package:flutter_vant_kit/widgets/cellGroup.dart';
import 'package:flutter_vant_kit/widgets/field.dart';
import 'package:flutter_vant_kit/widgets/cell.dart';
import 'package:flutter_vant_kit/widgets/button.dart';
import 'package:flutter_vant_kit/widgets/dialog.dart';
import 'package:flutter_vant_kit/widgets/picker.dart';

class AddressEdit extends StatefulWidget {
  // 地区选择列占位提示文字
  final String areaColumnsPlaceholder;
  // 收货人信息初始值
  final Map<String, dynamic>? addressInfo;
  // 是否显示邮政编码
  final bool showPostal;
  // 是否显示删除按钮
  final bool showDelete;
  // 是否显示默认地址栏
  final bool showSetDefault;
  // 保存按钮文字
  final String saveButtonText;
  // 删除按钮文字
  final String deleteButtonText;
  // 详细地址输入框行数
  final int detailRows;
  // 详细地址最大长度
  final int detailMaxlength;
  // 自定义内容
  final List<Widget>? children;
  // 点击保存按钮时触发
  final Function(Map map)? onSave;
  // 确认删除地址时触发
  final Function(Map map)? onDelete;
  // 取消删除地址时触发
  final Function(Map map)? onCancelDelete;

  AddressEdit(
      {Key? key,
      this.areaColumnsPlaceholder: "选择省 / 市 / 区",
      this.showPostal: true,
      this.showDelete: false,
      this.showSetDefault: false,
      this.saveButtonText: "保存",
      this.deleteButtonText: "删除",
      this.detailRows: 1,
      this.detailMaxlength: 200,
      this.addressInfo,
      this.children,
      this.onSave,
      this.onDelete,
      this.onCancelDelete})
      : super(key: key);

  @override
  _AddressEdit createState() => _AddressEdit();
}

class _AddressEdit extends State<AddressEdit> {
  Map input = {
    "name": TextEditingController(),
    "tel": TextEditingController(),
    "area": TextEditingController(),
    "addressDetail": TextEditingController(),
    "postalCode": TextEditingController(),
  };
  bool setDefaultAddress = false;
  Map<String, dynamic>? _addressInfo;
  List<PickerItem> options = [
    PickerItem("广东省", child: [
      PickerItem("广州市", child: [
        PickerItem("天河区"),
        PickerItem("萝岗区"),
        PickerItem("荔湾区"),
        PickerItem("番禺区"),
        PickerItem("白云区"),
      ]),
      PickerItem("深圳市", child: [
        PickerItem("南山区"),
        PickerItem("福田区"),
        PickerItem("龙岗区"),
        PickerItem("宝安区"),
        PickerItem("罗湖区"),
      ])
    ])
  ];
  List<int> _cityId = [];

  @override
  void initState() {
    _addressInfo = widget.addressInfo ?? {};
    List areas = [];
    (_addressInfo ?? {}).forEach((key, value) {
      if (["province", "city", "county"].contains(key) && value != null)
        areas.add(value);
      if (["provinceId", "cityId", "countyId"].contains(key))
        _cityId.add(value ?? 0);
      if (["name", "tel", "addressDetail", "postalCode"].contains(key) &&
          value != null) input[key].text = value;
    });
    input['area'].text = areas.join('/');
    super.initState();
  }

  getContent() {
    Map<String, dynamic> map = {};
    ["name", "tel", "addressDetail", "postalCode"].forEach((value) {
      map[value] = input[value].text;
    });
    List areas = input['area'].text.split('/');
    map['province'] = areas[0] ?? "";
    map['provinceId'] = _cityId[0];
    map['city'] = areas[1] ?? "";
    map['cityId'] = _cityId[1];
    map['county'] = areas[2] ?? "";
    map['countyId'] = _cityId[2];
    map["isDefault"] = _addressInfo!['isDefault'];
    _addressInfo = map;
    return map;
  }

  Widget buildNameField() {
    return Field(
      label: "姓名",
      placeholder: "收货人姓名",
      controller: input['name'],
    );
  }

  Widget buildPhoneField() {
    return Field(
      label: "手机号",
      placeholder: "收货人手机号",
      controller: input['tel'],
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(11)
      ],
    );
  }

  Widget buildAreaField() {
    return Field(
      label: "地区",
      placeholder: widget.areaColumnsPlaceholder,
      rightIcon: Icons.chevron_right,
      controller: input['area'],
      readonly: true,
      onClick: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Picker(
                colums: options,
                level: 3,
                defaultIndex: _cityId,
                showToolbar: true,
                onConfirm: (values, index) {
                  setState(() {
                    input['area'].text = values.join('/');
                    _cityId = index;
                  });
                  Navigator.of(context).pop();
                },
                onCancel: (values, index) {
                  Navigator.of(context).pop();
                },
              );
            });
      },
    );
  }

  Widget buildDetailField() {
    return Field(
      label: "详细地址",
      placeholder: "街道门牌、楼层房间号等信息",
      controller: input['addressDetail'],
      rows: widget.detailRows,
      maxLength: widget.detailMaxlength,
    );
  }

  Widget buildPostalField() {
    return Field(
      label: "邮政编码",
      placeholder: "邮政编码",
      controller: input['postalCode'],
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
        LengthLimitingTextInputFormatter(6)
      ],
    );
  }

  Widget buildSetDefault() {
    return Cell(
      title: "设为默认收货地址",
      customRight: SizedBox(
        height: Style.addressEditSwitchHeight,
        child: CupertinoSwitch(
          value: _addressInfo!["isDefault"] ?? false,
          activeColor: Style.addressEditSwitchColor,
          onChanged: (bool value) {
            setState(() {
              _addressInfo!["isDefault"] = value;
            });
          },
        ),
      ),
    );
  }

  Widget buildSaveButton() {
    return NButton(
      text: widget.saveButtonText,
      round: true,
      block: true,
      type: "danger",
      onClick: () {
        if (widget.onSave != null) widget.onSave!(getContent());
      },
    );
  }

  Widget buildCancelButton() {
    return NButton(
      text: widget.deleteButtonText,
      round: true,
      block: true,
      onClick: () {
        showDialog(
          context: context,
          builder: (_) {
            return NDialog(
              message: "确定要删除么",
              showCancelButton: true,
              onConfirm: () {
                if (widget.onDelete != null) widget.onDelete!(getContent());
              },
              onCancel: () {
                if (widget.onCancelDelete != null)
                  widget.onCancelDelete!(getContent());
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = widget.children ?? [];
    return Padding(
      padding: EdgeInsets.all(Style.addressEditPadding),
      child: Column(
        children: <Widget>[
          CellGroup(
            border: false,
            children: <Widget>[
              buildNameField(),
              buildPhoneField(),
              buildAreaField(),
              buildDetailField(),
              widget.showPostal ? buildPostalField() : Container(),
              ..._children,
            ],
          ),
          SizedBox(height: widget.showSetDefault ? Style.paddingMd : 0),
          widget.showSetDefault ? buildSetDefault() : Container(),
          Padding(
            padding: Style.addressEditButtonsPadding,
            child: Column(
              children: <Widget>[
                buildSaveButton(),
                SizedBox(height: Style.addressEditButtonMarginBottom),
                widget.showDelete ? buildCancelButton() : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
