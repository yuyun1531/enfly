import 'package:enfly/pages/chat.dart';
import 'package:enfly/pages/home.dart';
import 'package:enfly/pages/profile.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NavBar> {
  int _selectedIndex = 1; // 默认选中首页

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation Example'),
        ),
        body: Center(
          child: _getPage(_selectedIndex),
        ),
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
              label: 'GAGA页面',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue, // 高亮显示的颜色
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Profile();
      case 1:
        return const Home();
      case 2:
        return const Chat();
      default:
        return const Center(child: Text('页面未找到'));
    }
  }
}
