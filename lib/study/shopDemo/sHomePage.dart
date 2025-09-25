import 'package:flutter/material.dart';
import 'package:fluttertest/study/shopDemo/components/botNavBar.dart';
import 'package:fluttertest/study/shopDemo/pages/sdHome.dart';
import 'package:fluttertest/study/shopDemo/pages/sdShop.dart';
import 'package:fluttertest/utils/screenUtil.dart';

class SHomePage extends StatefulWidget {
  const SHomePage({super.key});

  @override
  State<SHomePage> createState() => _SHomePageState();
}

class _SHomePageState extends State<SHomePage> {
  int _curIndex = 0;
  final List<Widget> _pages = [SDHome(), SDShop()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(
            height: ScreenUtil.statusBarHeight(context),
          ),
          IndexedStack(
            index: _curIndex,
            children: _pages,
          )
        ],
      ),
      bottomNavigationBar: BotNavBar(
        onTabChange: (i) {
          setState(() {
            _curIndex = i;
          });
        },
      ),
    );
  }
}
