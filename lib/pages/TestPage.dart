import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TestPage extends StatefulWidget {
  const TestPage({super.key, this.tit = '111'});

  final String tit;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        drawer: Drawer(),
        appBar: AppBar(
          title: Center(
            child: Text(widget.tit),
          ),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Flutter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: () {}, child: Text("3232"))
              ],
            ),
          ),
        ));
  }
}
