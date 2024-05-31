import 'package:enfly/pages/chat.dart';
import 'package:enfly/pages/login.dart';
import 'package:enfly/provider/enfly_page.dart';
import 'package:enfly/theme/ui_theme.dart';
import 'package:flutter/material.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '英飞',
      theme: UITheme(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 10, 9, 9),
          ),
          shadowColor: const Color.fromARGB(49, 57, 57, 57),
          elevation: currentIndex == 0 ? 0 : 1,
          automaticallyImplyLeading: false,
          leading: null,
          title: const Text("英飞"),
          //centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: LoginPage(), //_changePage(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的信息',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: '聊天页面',
            ),
          ],
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _changePage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('我的信息页面'));
      case 1:
        return const Center(child: Text('首页页面'));
      case 2:
        return const Center(child: Text('聊天页面'));
      default:
        return const Center(child: Text('页面未找到'));
    }
  }
}
