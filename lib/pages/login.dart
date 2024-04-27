import 'dart:io';

import 'package:enfly/provider/theme.dart';
import 'package:enfly/routs.dart';
import 'package:enfly/theme/color.dart';
import 'package:enfly/utils/commonUtils.dart';
import 'package:enfly/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: AppLayout(),
          resizeToAvoidBottomInset: false,
        ));
  }
}

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Stack(
        children: [
          const AppLogo(),
          LoginForm(),
        ],
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final theme = Provider.of<DefaultThemeData>(context).theme;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.lightPrimaryColor ?? CommonColor.lightPrimaryColor,
                    theme.primaryColor ?? CommonColor.primaryColor
                  ]),
            ),
            child: Image.asset("assets/hero_image.png",
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                height: 500)),
        Positioned(
          child: Container(
            padding: EdgeInsets.only(top: height / 30, left: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: CommonUtils.adaptWidth(380),
                  width: CommonUtils.adaptWidth(140),
                  child: const Image(
                    image: AssetImage("assets/logo_transparent.png"),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: CommonUtils.adaptHeight(180),
                  padding: const EdgeInsets.only(top: 10, left: 12, right: 15),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "腾讯云即时通信IM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: CommonUtils.adaptFontSize(58),
                        ),
                      ),
                      Text(
                        "欢迎使用本 APP 体验腾讯云 IM 产品服务",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: CommonUtils.adaptFontSize(26),
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String userID = '';

  @override
  initState() {
    super.initState();
    //checkFirstEnter();
  }

  TextSpan webViewLink(String title, String url) {
    return TextSpan(
      text: title,
      style: const TextStyle(
        color: Color.fromRGBO(0, 110, 253, 1),
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PrivacyDocument(title: title, url: url))); */
        },
    );
  }

  void checkFirstEnter() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    SharedPreferences prefs = await _prefs;
    String? firstTime = prefs.getString("firstTime");
    if (firstTime != null && firstTime == "true") {
      return;
    }
    showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          content: Text.rich(
            TextSpan(
                style: const TextStyle(
                    fontSize: 14, color: Colors.black, height: 2.0),
                children: [
                  TextSpan(
                    text: "欢迎使用腾讯云内容。",
                  ),
                  const TextSpan(
                    text: "\n",
                  ),
                  TextSpan(
                    text: "请您点击",
                  ),
                  webViewLink("《用户协议》", ''),
                  TextSpan(
                    text: ", ",
                  ),
                ]),
            overflow: TextOverflow.clip,
          ),
          actions: [
            CupertinoDialogAction(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 110, 253, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Text("同意并继续",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16))),
              onPressed: () {
                prefs.setString("firstTime", "true");
                Navigator.of(context).pop(true);
              },
            ),
            CupertinoDialogAction(
              child: Text("不同意并退出",
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              isDestructiveAction: true,
              onPressed: () {
                exit(0);
              },
            ),
          ],
        );
      },
    );
  }

  directToHomePage() {
    Routes().directToHomePage();
  }

  userLogin() async {
    if (userID.trim() == '') {
      ToastUtils.toast("请输入用户名");
      return;
    }

    String userSig = "123";

    /* var data = await coreInstance.login(
      userID: userID,
      userSig: userSig,
    );
    if (data.code != 0) {
      final option1 = data.desc;
      ToastUtils.toast("登录失败{{option1}}");
      return;
    } */
    directToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(750, 1624),
      minTextAdapt: true,
    );
    return Stack(
      children: [
        Positioned(
            bottom: CommonUtils.adaptHeight(200),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
              decoration: const BoxDecoration(
                //背景
                color: Colors.white,

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                //设置四周边框
              ),
              // color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  CommonUtils.adaptHeight(600),

              width: MediaQuery.of(context).size.width,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: CommonUtils.adaptFontSize(34)),
                      child: Text(
                        "用户名",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: CommonUtils.adaptFontSize(34),
                        ),
                      ),
                    ),
                    TextField(
                      autofocus: false,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(left: CommonUtils.adaptWidth(14)),
                        hintText: "请输入用户名",
                        hintStyle:
                            TextStyle(fontSize: CommonUtils.adaptFontSize(32)),
                        //
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        setState(() {
                          userID = v;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: CommonUtils.adaptHeight(46),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text("登录"),
                              onPressed: userLogin,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
