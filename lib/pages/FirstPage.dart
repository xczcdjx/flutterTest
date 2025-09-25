import 'package:flutter/material.dart';
import 'package:fluttertest/study/shopDemo/shopPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return ShopPage();
  }
}
