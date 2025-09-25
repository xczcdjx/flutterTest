import 'package:flutter/material.dart';

class SDHome extends StatefulWidget {
  const SDHome({super.key});

  @override
  State<SDHome> createState() => _SDHomeState();
}

class _SDHomeState extends State<SDHome> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "count :$count",
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  count += 1;
                });
              },
              child: Text("add"))
        ],
      ),
    );
  }
}
