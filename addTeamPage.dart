import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:x/CustomWidget/customWidget.dart';
import 'package:x/api/team.dart';
import 'package:x/api/teamPower.dart';
import 'package:x/config/AppColor.dart';
import 'package:x/model/powerListModel.dart';
import 'package:x/model/powerModel.dart';
import 'package:x/model/teamModel.dart';
import 'package:x/util/screen.dart';

class AddTeamPage extends StatefulWidget {
  @override
  _AddTeamPageState createState() => _AddTeamPageState();
}

class _AddTeamPageState extends State<AddTeamPage> {
  List<PowerSetInfoModel> _powerList = [];
  TeamRequestModel teamRequestModel = TeamRequestModel(page: 1);
  var _teamName = new TextEditingController();
  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _getPowerListData();
  }

  _getPowerListData() async {
    PowerListResponseModel powerListResponseModel = await TeamPowerApi.getData(
        context: context, powerRequestModel: PowerRequestModel());
    setState(() {
      this._powerList = (powerListResponseModel.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.tabBgColor,
          title: CustomWidget.getAppbarTitle("增加权限组"),
          leading: CustomWidget.getAppbarLeading(() {
            Navigator.of(context).pop();
          }),
          //设置导航的图标
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.6,
          automaticallyImplyLeading: true),
      backgroundColor: AppColors.mainBgColor,
      body: Container(
        color: Color.fromRGBO(240, 240, 240, 1),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: ListView(
                controller: _controller,
                children: [
                  CustomWidget.inputWidget(
                      "权限组名称", "请输入角色名称", _teamName, TextInputType.text),
                  _getTitleWidget(),
                  Container(
                    child: ListView(
                      controller: _controller,
                      shrinkWrap: true,
                      children: _getPowerList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sySetHeight(20),
            ),
            CustomWidget.getBottomWidget("保存", _AddUserRequest),
          ],
        ),
      ),
    );
  }

  _getPowerList() {
    List<Widget> list = [];
    int index = 0;
    print("数组长度是" + _powerList.length.toString());
    if (_powerList.length > 0) {
      _powerList.forEach((element) {
        list.add(_getBlackWiget());
        list.add(_getItemWidget(element, index));

        if (element.child.length > 0) {
          list.add(getItemList(element, index));
        }
        index++;
      });
    } else {
      list.add(Text(""));
    }
    return list;
  }

  _getBlackWiget() {
    return SizedBox(
      height: sySetHeight(20),
    );
  }

  _getItemWidget(PowerSetInfoModel powerSetInfoModel, int index) {
    return InkWell(
      child: Container(
        height: sySetHeight(116),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: sySetHeight(30)),
              child: Text(
                powerSetInfoModel.powerName,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.mainFontColor,
                  fontSize: sySetFontSize(30),
                ),
              ),
            ),
            Expanded(
              child: Container(child: Text("")),
            ),
            Container(
              child: Checkbox(
                activeColor: Color.fromRGBO(37, 117, 228, 1),
                onChanged: (bool value) {
                  setState(() {
                    _powerList[index].isHad = !_powerList[index].isHad;
                    if (_powerList[index].isHad == false) {
                      _powerList[index].child.forEach((element) {
                        element.isHad = false;
                      });
                    } else {
                      _powerList[index].child.forEach((element) {
                        element.isHad = true;
                      });
                    }
                  });
                },
                value: powerSetInfoModel.isHad,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColors.mainItemBgColor,
          border: Border(
            bottom: BorderSide(
              width: sySetWidth(2),
              color: Color.fromRGBO(229, 229, 229, 1),
            ),
          ),
        ),
      ),
      onTap: () {
        //跳转到详情页
        setState(() {
          _powerList[index].isHad = !_powerList[index].isHad;
          if (_powerList[index].isHad == false) {
            _powerList[index].child.forEach((element) {
              element.isHad = false;
            });
          } else {
            _powerList[index].child.forEach((element) {
              element.isHad = true;
            });
          }
        });
      },
    );
  }

  _getPowerWidget(PowerSetInfoModel listItem, int parentIndex) {
    List<Widget> list = [];
    int index = 0;
    if (listItem.child.length > 0) {
      listItem.child.forEach(
        (v) {
          var t = _getCheckBoxWidget(v, parentIndex, index);
          list.add(t);
          index++;
        },
      );
    }
    return list;
  }

  getItemList(PowerSetInfoModel powerSetInfoModel, int index) {
    return ListView(
      shrinkWrap: true,
      controller: _controller,
      children: [
        Wrap(
          children: _getPowerWidget(powerSetInfoModel, index),
        )
      ],
    );
  }

  _getCheckBoxWidget(
      PowerSetInfoModel powerSetInfoModel, int parentIndex, int childIndex) {
    return Container(
      height: sySetHeight(110),
      width: sySetWidth(370),
      child: CheckboxListTile(
        title: Text(
          powerSetInfoModel.powerName,
          style: TextStyle(fontSize: sySetFontSize(26)),
        ),
        onChanged: (v) {
          setState(() {
            this._powerList[parentIndex].child[childIndex].isHad = v;
            if (v == true) {
              this._powerList[parentIndex].isHad = true;
            } else {
              bool isallFalse = false;
              this._powerList[parentIndex].child.forEach((element) {
                if (element.isHad == true) {
                  isallFalse = true;
                }
              });
              if (isallFalse == false) {
                this._powerList[parentIndex].isHad = false;
              }
            }
          });
        },
        activeColor: AppColors.buttonMainColor,
        value: powerSetInfoModel.isHad,
      ),
      decoration: BoxDecoration(
        color: AppColors.mainItemBgColor,
        border: Border(
          bottom: BorderSide(
            width: sySetWidth(2),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ),
    );
  }

  _getTitleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      height: sySetHeight(110),
      decoration: BoxDecoration(
        color: AppColors.mainItemBgColor,
        border: Border(
          bottom: BorderSide(
            width: sySetWidth(2),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: sySetWidth(24)),
        child: Text(
          "设置权限",
          style: TextStyle(
            color: AppColors.mainFontColor,
            fontSize: sySetFontSize(30),
          ),
        ),
      ),
    );
  }

  _AddUserRequest() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..userInteractions = true
      ..loadingStyle = EasyLoadingStyle.light;

    if (_teamName.value.text.isEmpty) {
      EasyLoading.showToast("请输入角色名称");
      return;
    }
    EasyLoading.show(status: "loading...", dismissOnTap: true);
    List<int> list = [];
    _powerList.forEach((element) {
      if (element.isHad == true) {
        list.add(element.powerId);
      }
      if (element.child.length > 0) {
        element.child.forEach((v) {
          if (v.isHad == true) {
            list.add(v.powerId);
          }
        });
      }
    });
    TeamAddRequestModel teamAddRequestModel =
        TeamAddRequestModel(data: list, teamName: this._teamName.value.text);
    TeamApi.addTeam(
      context: context,
      teamAddRequestModel: teamAddRequestModel,
    ).then((value) {
      if (value.code != 0) {
        EasyLoading.showToast(value.message);
        return;
      }
      EasyLoading.showSuccess(value.message,
              duration: Duration(milliseconds: 900))
          .then((value) {
        Navigator.of(context).pop();
      });
    });
  }
}
