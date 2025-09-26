import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertest/study/shopDemo/state.dart';
import 'package:fluttertest/utils/NetImage.dart';
import 'package:provider/provider.dart';

import '../entity/goodEntity.dart';

class SDShop extends StatefulWidget {
  const SDShop({super.key});

  @override
  State<SDShop> createState() => _SDShopState();
}

class _SDShopState extends State<SDShop> {
  _removeCart(GoodEntity g) {
    Provider.of<CartState>(context, listen: false).removeCart(g);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Removed successfully"),
            ));
  }

  _controlCount(GoodEntity g, [int c = 1]) {
    Provider.of<CartState>(context, listen: false).controlCount(g.name, c);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
        builder: (context, value, c) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "My Cart",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, i) {
                            final c = value.cart[i];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Slidable(
                                endActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (f) {
                                          _removeCart(c);
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        icon: Icons.delete,
                                        backgroundColor: Colors.red,
                                      )
                                    ]),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, right: 15, bottom: 10, left: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          NetImage(
                                            url: c.path,
                                            width: 50,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                c.name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "\$ ${c.price}",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: c.count>=99?null:() {
                                                _controlCount(
                                                  c,
                                                );
                                              },
                                              icon: Icon(Icons.add)),
                                          Text(
                                            c.count.toString(),
                                            style: TextStyle(
                                                color: Colors.orangeAccent),
                                          ),
                                          IconButton(
                                              onPressed: c.count<=1?null:() {
                                                _controlCount(c, -1);
                                              },
                                              icon: Icon(Icons.remove)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            ));
  }
}
