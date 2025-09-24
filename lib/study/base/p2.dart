
import 'package:flutter/material.dart';

class P2 extends StatelessWidget {
  const P2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.deepPurple[400],
              ),
            ),
            // 填充剩余空间
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepPurple[200],
              ),
            )
          ],
        ));
  }
}
