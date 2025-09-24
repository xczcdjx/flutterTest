import 'package:flutter/material.dart';

class P3 extends StatefulWidget {
  const P3({super.key});

  @override
  State<P3> createState() => _P3();
}

class _P3 extends State<P3> {
  List<String> names = ["jjjjj", "kkkk", "iiii"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        /*ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 350,
          color: Colors.deepPurple,
        ),
        Container(
          width: 350,
          color: Colors.deepPurple[400],
        ),
        Container(
          width: 350,
          color: Colors.deepPurple[200],
        )
      ],
    )*/
        // ListView.builder
        /*ListView.builder(
                itemCount: names.length,
                itemBuilder: (ctx, i) {
                  final n = names[i];
                  return ListTile(
                    title: Text(n),
                  );
                });*/
        // GridView
        /*GridView.builder(
              // 总数
              itemCount: 64,
                // 列数量
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (ctx, index) => Container(
                      color: Colors.deepPurple,
                      margin: EdgeInsets.all(2),
                    ));*/
        // Stack
        /*Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(3, (i) {
            final s = 100 * (3 - i).toDouble();
            return Container(
              width: s,
              height: s,
              color: Colors.deepPurple[s.toInt()],
            );
          })
        ],
      ),
    )*/
        // GestureDetector
        Center(
          child: GestureDetector(
            onTap: (){
              print("1111");
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.deepPurple[200],
              child: Center(
                child: Text("Tap me"),
              ),
            ),
          ),
        ));
  }
}
