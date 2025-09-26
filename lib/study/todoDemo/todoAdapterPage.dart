import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertest/utils/hiveUtil.dart';
import 'package:oktoast/oktoast.dart';

import '../../entity/todo_cls.dart';
import '../../utils/hiveUtilTypedAdapter.dart';


class TodoAdapterPage extends StatefulWidget {
  const TodoAdapterPage({super.key});

  @override
  State<TodoAdapterPage> createState() => _TodoAdapterPageState();
}

class _TodoAdapterPageState extends State<TodoAdapterPage> {
  /* List<TodoCls> todos = [
    TodoCls.f("1", "上班", true),
    TodoCls(id: "2", label: "摸鱼"),
    TodoCls(id: "3", label: "学习"),
  ];*/

  List<TodoCls> todos = [];

  // textController
  TextEditingController todoController = TextEditingController();

  void greetMsgUser() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    final saveTodos = await HiveUtilTypeAdapter.getList<TodoCls>('todoBox');
    // 获取单个
    // final todo = await HiveUtilTypeAdapter.getByKey<TodoCls>('todoBox', saveTodos[1].id);
    setState(() {
      todos = saveTodos;
    });
  }

  Future<void> _saveHive() async {
    await HiveUtilTypeAdapter.setList<TodoCls>('todoBox', todos,
        keyExtractor: (t) => t.id);
  }

  void _changeChecked(f, td) {
    final newTodos = todos.map((it) {
      if (it.id == td.id) return it.copyWith(done: f);
      return it;
    }).toList();
    setState(() {
      todos = newTodos;
    });
    _saveHive();
  }

  void _addTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.yellow,
            title: Center(
              child: Text("Add Todo"),
            ),
            content: TextField(
              controller: todoController,
              decoration: InputDecoration(
                  hint: Text("输入 todo"), border: OutlineInputBorder()),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      final t = todoController.text;
                      todos = [
                        TodoCls(id: DateTime.timestamp().toString(), label: t),
                        ...todos
                      ];
                      showToast('新增成功');
                      _saveHive();
                      FocusScope.of(context).unfocus();
                      todoController.clear();
                    });
                  },
                  child: Text("add"))
            ],
          );
        });
  }

  void _delTodo(String id) {
    setState(() {
      todos = todos.where((t) => t.id != id).toList();
    });
    _saveHive();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Center(
          child: Text(
            "To Do",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  todos = [];
                });
                HiveUtil.deleteKey("todos");
                showToast('删除成功', position: ToastPosition.bottom);
              },
              child: Text("Clear All"))
        ],
      ),
      // drawer
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: todos.isNotEmpty
            ? ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, i) {
              final todo = todos[i];
              return
                Slidable(
                endActionPane:
                ActionPane(motion: ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (f) {
                      _delTodo(todo.id);
                    },
                    borderRadius: BorderRadius.circular(10),
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                  )
                ]),
                child: ListTile(
                  leading: Text(
                    "${i + 1}.",
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Checkbox(
                      value: todo.done,
                      onChanged: (f) {
                        _changeChecked(f, todo);
                      }),
                  title: Text(
                    todo.label,
                    style: TextStyle(
                        decoration:
                        todo.done ? TextDecoration.lineThrough : null),
                  ),
                ),
              );
            })
            : Center(
          child: Text(
            'No Todo',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
