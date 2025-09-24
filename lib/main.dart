import 'package:flutter/material.dart';
import 'package:fluttertest/pages/FirstPage.dart';
import 'package:fluttertest/pages/HomePage.dart';
import 'package:fluttertest/pages/SecondPage.dart';
import 'package:fluttertest/pages/TestPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 隐藏debug标志
      title: 'Flutter Test',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FirstPage(),
      routes: {
        '/homePage':(ctx)=>HomePage(),
        '/testPage':(ctx)=>TestPage(),
        '/secondPage':(ctx)=>SecondPage(),
      },
      // const TestPage()
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  ({int pageNo, int pageSize}) pageModel = (pageNo: 1, pageSize: 10);
  (int,int) pageModel2 = (2,5);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    pageModel=(pageNo: pageModel.pageNo+1,pageSize: 10);
    pageModel2=(pageModel2.$1+1,pageModel2.$2);
  }

  @override
  Widget build(BuildContext context) {
    var (p,s)=pageModel2;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Text(pageModel.pageNo.toString()),
          Text(p.toString(),style: TextStyle(color: Colors.blue),),
          Text("123"),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
