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
              label: '聊天页面',
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
