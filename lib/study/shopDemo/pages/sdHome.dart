import 'package:flutter/material.dart';
import 'package:fluttertest/study/shopDemo/entity/goodEntity.dart';
import 'package:fluttertest/study/shopDemo/state.dart';
import 'package:fluttertest/utils/NetImage.dart';
import 'package:provider/provider.dart';

class SDHome extends StatefulWidget {
  const SDHome({super.key});

  @override
  State<SDHome> createState() => _SDHomeState();
}

class _SDHomeState extends State<SDHome> {
  // int count = 0;

  _addCart(GoodEntity g) {
    Provider.of<CartState>(context, listen: false).addCart(g);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Successfully added"),
              content: Text("check your cart"),
            ));
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(builder: (context, value, child) {
      final goodList = value.gL;
      return Column(children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search",
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "业精于勤荒于嬉，行成于思毁于随",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Hot Picks 🔥",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
              itemCount: goodList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                final g = goodList[i];
                return Container(
                  // padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                      left: 25, right: i == goodList.length - 1 ? 25 : 0),
                  width: 280,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: NetImage(
                            url: g.path,
                            height: 130,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          g.desc,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  g.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$ ${g.price}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _addCart(g);
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ]);
    });
  }
}
