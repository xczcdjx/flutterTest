import 'package:flutter/material.dart';
import 'package:fluttertest/pages/HomePage.dart';
import 'package:fluttertest/pages/otherPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex=0;
  final List _pages=[
    HomePage(),
    ProfilePage(),
    SettingPage()
  ];
  void _navigatorBottomBar(int i){
    setState(() {
      _selectedIndex=i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("1st page"),
        ),
      ),
      // drawer
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOMEPAGE".split('').join(' ')),
              onTap: () {
                Navigator.pushNamed(context, '/homePage');
              },
            ),
            ListTile(
              leading: Icon(Icons.tab_outlined),
              title: Text("TESTPAGE".split('').join(' ')),
              onTap: () {
                // 关闭Drawer
                Navigator.pop(context);
                Navigator.pushNamed(context, '/testPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("SECONDPAGE".split('').join(' ')),
              onTap: () {
                Navigator.pushNamed(context, '/secondPage');
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      /*Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // 路由跳转
                // 传统方式
                *//*Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => SecondPage())
                  );*//*
                // 命名跳转，需MaterialApp配置routes
                Navigator.pushNamed(context, "/secondPage");
              },
              child: Text("go Second"))
        ],
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
          onTap: _navigatorBottomBar,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
    );
  }
}
