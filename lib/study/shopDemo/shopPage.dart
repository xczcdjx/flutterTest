import 'package:flutter/material.dart';
import 'package:fluttertest/utils/NetImage.dart';
import 'package:fluttertest/utils/screenUtil.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ScreenUtil.enterFullScreen();
  }

  @override
  void deactivate(){
    print("1111");
    super.deactivate();
    // ScreenUtil.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NetImage(
                url: 'https://cdn.docschina.org/home/logo/webpack-offical.svg',
                height: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Webpack",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "用于现代 JavaScript 应用程序的静态模块打包工具",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/homePage');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(22)),
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                      "Shop Now",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
