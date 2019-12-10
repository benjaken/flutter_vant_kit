import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kit/utils/index.dart';
import 'package:flutter_kit/widgets/cellGroup.dart';
import 'package:flutter_kit/widgets/field.dart';
import 'package:flutter_kit/widgets/cell.dart';
import 'package:flutter_kit/widgets/button.dart';
import 'package:flutter_kit/widgets/dialog.dart';

typedef ValueCallBack(Map map);

class AddressEdit extends StatefulWidget {
  // 地区选择列占位提示文字	
  final String areaColumnsPlaceholder;
  // 收货人信息初始值	
  Map<String, dynamic> addressInfo;
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
  List<Widget> children;
  // 点击保存按钮时触发	
  final ValueCallBack onSave;
  // 确认删除地址时触发	
  final ValueCallBack onDelete;
  // 取消删除地址时触发	
  final ValueCallBack onCancelDelete;

  AddressEdit({
    Key key,
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
    this.onCancelDelete
  }) : super(key: key);

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

  @override
  void initState () {
    List areas = [];
    (widget.addressInfo??{}).forEach((key, value) {
      if (["province", "city", "county"].contains(key) && value != null) areas.add(value);
      if (["name", "tel", "addressDetail", "postalCode"].contains(key) && value != null) input[key].text = value;
    });
    input['area'].text = areas.join('/');
    super.initState();
  }

  getContent () {
    Map<String, dynamic> map = {};
    ["name", "tel", "addressDetail", "postalCode"].forEach((value) {
      map[value] = input[value].text;
    });
    List areas = input['area'].text.split('/');
    Utils.toast(areas.toString());
    map['province'] = areas[0]??"";
    map['city'] = areas[1]??"";
    map['county'] = areas[2]??"";
    map["isDefault"] = widget.addressInfo['isDefault'];
    widget.addressInfo = map;
    return map;
  }
  
  @override
  Widget build(BuildContext context) {
    widget.children = widget.children??[];
    return Column(
      children: <Widget>[
        CellGroup(
          border: false,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white
          ),
          children: <Widget>[
            Field(
              label: "姓名",
              placeholder: "收货人姓名",
              controller: input['name'],
            ),
            Field(
              label: "手机号",
              placeholder: "收货人手机号",
              controller: input['tel'],
              keyboardType: TextInputType.phone,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                LengthLimitingTextInputFormatter(11)
              ],
            ),
            Field(
              label: "地区",
              placeholder: widget.areaColumnsPlaceholder,
              rightIcon: Icons.chevron_right,
              controller: input['area'],
              readonly: true,
              onClick: () {
                Utils.toast("Clicked");
              },
            ),
            Field(
              label: "详细地址",
              placeholder: "街道门牌、楼层房间号等信息",
              controller: input['addressDetail'],
              rows: widget.detailRows,
              maxLength: widget.detailMaxlength,
            ),
            widget.showPostal ? Field(
              label: "邮政编码",
              placeholder: "邮政编码",
              controller: input['postalCode'],
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                LengthLimitingTextInputFormatter(6)
              ],
            ) : Container(),
            ...widget.children,
          ],
        ),
        SizedBox(height: widget.showSetDefault ? 10 : 0),
        widget.showSetDefault ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white
          ),
          child: Cell(
            title: "设为默认收货地址",
            customRight: SizedBox(
              height: 20,
              child: CupertinoSwitch(
                value: widget.addressInfo["isDefault"]??false,
                activeColor: Colors.blueAccent,
                onChanged: (bool value) {
                  widget.addressInfo["isDefault"] = value;
                },
              ),
            ),
          ),
        ) : Container(),
        SizedBox(height: 30),
        CustomButton(
          text: widget.saveButtonText,
          round: true,
          block: true,
          color: Colors.red,
          onClick: () {
            if (widget.onSave != null) widget.onSave(getContent());
          },
        ),
        SizedBox(height: 10),
        widget.showDelete ? CustomButton(
          text: widget.deleteButtonText,
          round: true,
          block: true,
          color: Colors.white,
          onClick: () {
            showDialog(
              context: context,
              builder: (_) {
                return NDialog(
                  message: "确定要删除么",
                  showCancelButton: true,
                  onConfirm: () {
                    if (widget.onDelete != null) widget.onDelete(getContent());
                  },
                  onCancel: () {
                    if (widget.onCancelDelete != null) widget.onCancelDelete(getContent());
                  },
                );
              },
            );
          },
        ) : Container(),
      ],
    );
  }
}