import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertest/pages/HomePage.dart';
import 'package:fluttertest/utils/hiveUtil.dart';
import 'package:hive/hive.dart';
import 'package:oktoast/oktoast.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class TodoCls {
  String id;
  String label;
  bool done = false;

  TodoCls({required this.id, required this.label});

  TodoCls.f(this.id, this.label, bool d) : done = d;

  TodoCls copyWith({String? id, String? label, bool? done}) {
    return TodoCls.f(id ?? this.id, label ?? this.label, done ?? this.done);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'done': done,
    };
  }

  factory TodoCls.fromMap(Map<dynamic, dynamic> map) {
    return TodoCls.f(
      map['id'] as String,
      map['label'] as String,
      map['done'] as bool,
    );
  }
}

class _FirstPageState extends State<FirstPage> {
 /* List<TodoCls> todos = [
    TodoCls.f("1", "上班", true),
    TodoCls(id: "2", label: "摸鱼"),
    TodoCls(id: "3", label: "学习"),
  ];*/

  List<TodoCls> todos=HiveUtil.getList<TodoCls>('todos', (map) => TodoCls.fromMap(map));

  // textController
  TextEditingController todoController = TextEditingController();

  void greetMsgUser() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _initHive();
  }

  Future<void> _initHive() async {
    final saveTodos =
        HiveUtil.getList<TodoCls>('todos', (map) => TodoCls.fromMap(map));
    setState(() {
      todos = saveTodos;
    });
  }

  Future<void> _saveHive() async {
    await HiveUtil.setList<TodoCls>('todos', todos, (t) => t.toMap());
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
          ElevatedButton(onPressed: (){
            setState(() {
              todos=[];
            });
            HiveUtil.deleteKey("todos");
            showToast('删除成功',position: ToastPosition.bottom);
          }, child: Text("Clear All"))
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
                  return Slidable(
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
