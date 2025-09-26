import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:fluttertest/study/shopDemo/entity/cardEntity.dart';

import 'entity/goodEntity.dart';

class CartState with ChangeNotifier {
  final _goodList = [
    GoodEntity(
        name: "Angular",
        price: "3.11",
        desc: "应用程序设计框架和开发平台，用于创建高效且复杂的单页应用程序",
        path: "https://cdn.docschina.org/home/logo/angular.svg"),
    GoodEntity(
        name: "React",
        price: "6.11",
        desc: "构建用户界面的 JavaScript 库",
        path: "https://cdn.docschina.org/home/logo/react.svg"),
    GoodEntity(
        name: "Vue",
        price: "10.11",
        desc: "渐进式 JavaScript 框架",
        path: "https://cdn.docschina.org/home/logo/vue.svg"),
  ];
  List<CardEntity> cart = [];

  get gL => _goodList;

  void addCart(GoodEntity g) {
    int fIndex = cart.indexWhere((c) => c.name == g.name);
    if (fIndex != -1) {
      cart[fIndex].count += 1;
    } else {
      cart = [CardEntity.add(g), ...cart];
    }
    notifyListeners();
  }

  void controlCount(String n, int count) {
    cart = cart.map((c) {
      if (c.name == n) {
        int cc = max(1, min(count + c.count, 99));
        c.count = cc;
      }
      return c;
    }).toList();
    notifyListeners();
  }

  void removeCart(GoodEntity g) {
    cart = cart.where((c) => c.name != g.name).toList();
    notifyListeners();
  }
}
