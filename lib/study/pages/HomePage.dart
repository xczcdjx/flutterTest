import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Home Page"),
        Text("Count ${count}"),
        TextButton(onPressed: (){
          setState(() {
            count+=1;
          });
        }, child: Text("count ++"))
      ],)),
    );
  }
}
