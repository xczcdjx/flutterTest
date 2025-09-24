import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/TestPage.dart';

class ToDoCls {
  String id;
  String tit;
  bool done;

  ToDoCls({required this.id, required this.tit, this.done = false});
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<ToDoCls> todos = [
    ToDoCls(id: '1', tit: "吃饭"),
    ToDoCls(id: '2', tit: "睡觉", done: true),
    ToDoCls(id: '3', tit: "上班"),
  ];
  final TextEditingController _controller = TextEditingController();

  Future _addTodo() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('添加todo'),
          content: TextField(
            controller: _controller,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(labelText: '标题'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  todos=[ToDoCls(
                      id: DateTime.now().microsecond.toString(),
                      tit: _controller.text),...todos];
                });
                _controller.text='';
              },
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text('Todo')],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        floatingActionButton:
            TextButton(onPressed: _addTodo, child: Icon(Icons.add)),
        body: Column(
          children: [
            Container(
              height: 300,
              child: ListView(
                children: todos.asMap().entries.map((it) {
                  var v = it.value;
                  return ListTile(
                    title: Text(v.tit),
                    leading: Text('${it.key + 1}'),
                    trailing: Container(
                      width: 120,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  todos = todos
                                      .where((it) => it.id != v.id)
                                      .toList();
                                });
                              },
                              child: Text('delete')),
                          Checkbox(
                              value: v.done,
                              onChanged: (f) => {
                                    setState(() {
                                      todos = todos.map((it) {
                                        if (it.id == v.id) it.done = f!;
                                        return it;
                                      }).toList();
                                    })
                                  })
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('共计${todos.length}'),
                SizedBox(width: 10),
                Text('已完成${todos.fold(0, (p, c) => p += c.done ? 1 : 0)}'),
              ],
            ),
            ElevatedButton(onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>TestPage()));
              Navigator.pushNamed(context, '/secondPage');
            }, child: Text("Test Page"))
          ],
        ));
  }
}
