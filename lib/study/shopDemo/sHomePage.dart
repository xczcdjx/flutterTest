import 'package:flutter/material.dart';
import 'package:fluttertest/study/shopDemo/components/botNavBar.dart';
import 'package:fluttertest/study/shopDemo/pages/sdHome.dart';
import 'package:fluttertest/study/shopDemo/pages/sdShop.dart';
import 'package:fluttertest/utils/NetImage.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (ctx) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                  icon: Icon(Icons.menu)),
            )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: NetImage(
                      url: 'https://cdn.docschina.org/home/logo/webpack-offical.svg',
                      height: 80,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.home,color: Colors.white),
                    title: Text("Home",style: TextStyle(color: Colors.white),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text("About",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text("Logout",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _curIndex,
        children: _pages,
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
