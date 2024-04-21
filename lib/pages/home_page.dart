import 'package:enfly/provider/enfly_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 首页
class HomePage extends StatefulWidget {
  final int pageIndex;

  const HomePage({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool hasInit = false;
  bool hasInternet = true;
  int currentIndex = 0;
  String pageName = "";

  getLoginUserInfo() async {
    /* if (PlatformUtils().isWeb) {
      return;
    }
    final res = await _sdkInstance.getLoginUser();
    if (res.code == 0) {
      final result = await _sdkInstance.getUsersInfo(userIDList: [res.data!]);

      if (result.code == 0) {
        Provider.of<LoginUserInfo>(context, listen: false)
            .setLoginUserInfo(result.data![0]);
      }
    } */
  }

  _initTrtc() async {
    // final TUICallKit _callKit = TUICallKit.instance;
    // _callKit.enableFloatWindow(true);
  }

  @override
  initState() {
    super.initState();
    currentIndex = widget.pageIndex;
    _initTrtc();
    setState(() {});
    getLoginUserInfo();
    initOfflinePush();
  }

  initOfflinePush() async {
    /* if (PlatformUtils().isMobile) {
      await ChannelPush.init(handleClickNotification);
      uploadOfflinePushInfoToken();
    } */
  }

  @override
  dispose() {
    super.dispose();
  }

  /* Map<int, String> pageTitle(LocalSetting localSetting) {
    final String connectText =
        localSetting.connectStatus == ConnectStatus.connecting
            ? TIM_t("连接中...")
            : TIM_t("连接失败");
    return {
      0: localSetting.connectStatus == ConnectStatus.success
          ? TIM_t("消息")
          : connectText,
      1: TIM_t("通讯录"),
      2: TIM_t("直播"),
      3: TIM_t("我的"),
    };
  } */

  List<NavigationBarData> getBottomNavigatorList(BuildContext context, theme) {
    final List<NavigationBarData> bottomNavigatorList = [
      /* NavigationBarData(
        widget: Conversation(
          key: conversationKey,
          conversationController: _conversationController,
        ),
        title: TIM_t("消息"),
        selectedIcon: Stack(
          clipBehavior: Clip.none,
          children: [
            ColorFiltered(
              child: Image.asset(
                "assets/chat_active.png",
                width: 24,
                height: 24,
              ),
              colorFilter: ColorFilter.mode(
                  theme.primaryColor ?? CommonColor.primaryColor,
                  BlendMode.srcATop),
            ),
            Positioned(
              top: -5,
              right: -6,
              child: UnconstrainedBox(
                child: TIMUIKitConversationTotalUnread(width: 16, height: 16),
              ),
            )
          ],
        ),
        unselectedIcon: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/chat.png",
              width: 24,
              height: 24,
            ),
            Positioned(
              top: -5,
              right: -6,
              child: UnconstrainedBox(
                child: TIMUIKitConversationTotalUnread(width: 16, height: 16),
              ),
            )
          ],
        ),
      ),
      NavigationBarData(
        widget: const Contact(),
        title: TIM_t("通讯录"),
        selectedIcon: Stack(
          clipBehavior: Clip.none,
          children: [
            ColorFiltered(
              child: Image.asset(
                "assets/contact_active.png",
                width: 24,
                height: 24,
              ),
              colorFilter: ColorFilter.mode(
                  theme.primaryColor ?? CommonColor.primaryColor,
                  BlendMode.srcATop),
            ),
            const Positioned(
              top: -5,
              right: -6,
              child: UnconstrainedBox(
                child: TIMUIKitUnreadCount(
                  width: 16,
                  height: 16,
                ),
              ),
            )
          ],
        ),
        unselectedIcon: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/contact.png",
              width: 24,
              height: 24,
            ),
            const Positioned(
              top: -5,
              right: -6,
              child: UnconstrainedBox(
                child: TIMUIKitUnreadCount(
                  width: 16,
                  height: 16,
                ),
              ),
            )
          ],
        ),
      ),
      NavigationBarData(
        widget: const Live(),
        title: TIM_t("直播"),
        selectedIcon: ColorFiltered(
            child: const Icon(
              Icons.live_tv_rounded,
              size: 24,
            ),
            colorFilter: ColorFilter.mode(
                theme.primaryColor ?? CommonColor.primaryColor,
                BlendMode.srcATop)),
        unselectedIcon: const Icon(
          Icons.live_tv_rounded,
          size: 24,
        ),
      ),
      NavigationBarData(
        widget: const MyProfile(),
        title: TIM_t("我的"),
        selectedIcon: ColorFiltered(
            child: Image.asset(
              "assets/profile_active.png",
              width: 24,
              height: 24,
            ),
            colorFilter: ColorFilter.mode(
                theme.primaryColor ?? CommonColor.primaryColor,
                BlendMode.srcATop)),
        unselectedIcon: Image.asset(
          "assets/profile.png",
          width: 24,
          height: 24,
        ),
      ), */
    ];

    return bottomNavigatorList;
  }

  List<NavigationBarData> bottomNavigatorList(theme) {
    return getBottomNavigatorList(context, theme);
  }

  Widget? getTitle() {
    /* return Text(
      pageTitle(localSetting)[currentIndex]!,
      style: const TextStyle(
          color: Colors.white, fontSize: IMDemoConfig.appBarTitleFontSize),
    ); */
    return null;
  }

  ///关闭
  close() {
    Navigator.of(context).pop();
  }

  _handleTapTooltipItem(String id) {
    switch (id) {
      case "addFriend":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddFriend(),
          ),
        );
        break;
      case "addGroup":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddGroup(),
          ),
        );
        break;
      case "createConv":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateGroup(
              convType: GroupTypeForUIKit.single,
            ),
          ),
        );
        break;
      case "createGroup":
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateGroupIntroduction(),
          ),
        );
        break;
    }
  }

  List<Widget> _getTooltipContent(BuildContext context) {
    List toolTipList = currentIndex == 1 ? contactTooltip : conversationTooltip;

    return toolTipList.map((e) {
      return InkWell(
        onTap: () {
          _handleTapTooltipItem(e["id"]!);
          tooltip!.close();
        },
        child: Row(
          children: [
            Image.asset(
              e["asset"]!,
              width: 21,
              height: 21,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(e['label']!)
          ],
        ),
      );
    }).toList();
  }

  _showTooltip(BuildContext context) {
    /* tooltip = SuperTooltip(
        minimumOutSidePadding: 5,
        arrowTipDistance: 15,
        arrowBaseWidth: 15.0,
        arrowLength: 10.0,
        // maxHeight: 110,
        // maxWidth: 110,
        borderColor: Colors.white,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        content: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: [..._getTooltipContent(context)],
        ),
        popupDirection: TooltipDirection.down);
    tooltip?.show(context); */
  }

  //如果点击的导航页不是当前项，切换
  void _changePage(int index, BuildContext context) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
        if (index == 1) {
          pageName = 'concat';
        }
        if (index == 2) {
          pageName = 'userProfile';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /* final LocalSetting localSetting = Provider.of<LocalSetting>(context);
    ScreenUtil.init(
      context,
      designSize: const Size(750, 1624),
      minTextAdapt: true,
    ); */
    final theme = null;
    //Provider.of<DefaultThemeData>(context).theme;
    return EnflyPage(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              //shadowColor: theme.weakDividerColor,
              elevation: currentIndex == 0 ? 0 : 1,
              automaticallyImplyLeading: false,
              leading: null,
              title: getTitle(null),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    //theme.lightPrimaryColor ?? CommonColor.lightPrimaryColor,
                    //theme.primaryColor ?? CommonColor.primaryColor
                  ]),
                ),
              ),
              actions: [
                if ([0, 1].contains(currentIndex))
                  Builder(builder: (BuildContext c) {
                    return IconButton(
                        onPressed: () {
                          _showTooltip(c);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ));
                  })
              ],
            ),
            body: IndexedStack(
              index: currentIndex,
              children:
                  bottomNavigatorList(theme).map((res) => res.widget!).toList(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: List.generate(
                bottomNavigatorList(theme).length,
                (index) => BottomNavigationBarItem(
                  icon: index == currentIndex
                      ? bottomNavigatorList(theme)[index].selectedIcon
                      : bottomNavigatorList(theme)[index].unselectedIcon,
                  label: bottomNavigatorList(theme)[index].title,
                ),
              ),
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                _changePage(index, context);
                /* if (isNeedMoveToConversation) {
                  if (index == 0 && currentIndex == 0) {
                    conversationKey.currentState
                        ?.scrollToNextUnreadConversation();
                  }
                }
                isNeedMoveToConversation = true;
                Future.delayed(const Duration(milliseconds: 300), () {
                  isNeedMoveToConversation = false;
                }); */
              },
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: Colors.grey,
              backgroundColor: theme.weakBackgroundColor,
            )),
        name: pageName);
  }
}

/// 底部导航栏数据对象
class NavigationBarData {
  /// 未选择时候的图标
  final Widget unselectedIcon;

  /// 选择后的图标
  final Widget selectedIcon;

  /// 标题内容
  final String title;

  /// 页面组件
  final Widget? widget;

  final ValueChanged<int>? onTap;

  final int? index;

  NavigationBarData(
      {required this.unselectedIcon,
      required this.selectedIcon,
      required this.title,
      this.widget,
      this.onTap,
      this.index});
}
