import 'package:flutter/material.dart';
import 'package:fluttertest/pages/HomePage.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key});

  @override
  State<InputTest> createState() => _InputTestState();
}

class _InputTestState extends State<InputTest> {
  // textController
  TextEditingController myController = TextEditingController();
  String greetMsg = "";

  void greetMsgUser() {
    setState(() {
      greetMsg = "Hello " + myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Todo page"),
        ),
      ),
      // drawer
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                greetMsg,
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
              // TextField
              TextField(
                decoration: InputDecoration(
                    hintText: "Type your name", border: OutlineInputBorder()),
                controller: myController,
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    greetMsgUser();
                    myController.clear();
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
