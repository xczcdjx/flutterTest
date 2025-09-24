
import 'package:flutter/material.dart';

import '../../style/parseColor.dart';

class P1 extends StatelessWidget {
  const P1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My App Bar"),
          elevation: 0,
          backgroundColor: Colors.deepPurple,
          leading: Icon(Icons.menu),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.logout))
          ],
        ),
        backgroundColor: Colors.deepPurple[200],
        body: Center(
          child: Container(
              height: 300,
              width: 300,
              // 使用decoration时颜色需要转移至内部
              decoration: BoxDecoration(
                  color: parseCssColor('#0066ff'),
                  borderRadius: BorderRadius.circular(20)
              ),
              padding: EdgeInsets.all(25),
              child:
              /* Text("独角戏",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),*/
              Icon(Icons.favorite,color: Colors.white,size: 64,)
          ),
        ));
  }
}
