import 'package:hive/hive.dart';

part 'todo_cls.g.dart'; // 自动生成的文件

@HiveType(typeId: 0) // 每个类唯一 ID
class TodoCls extends HiveObject{
  @HiveField(0)
  String id;

  @HiveField(1)
  String label;

  @HiveField(2)
  bool done;

  TodoCls({required this.id, required this.label, this.done = false});

  TodoCls.f(this.id, this.label, bool d) : done = d;

  TodoCls copyWith({String? id, String? label, bool? done}) {
    return TodoCls.f(id ?? this.id, label ?? this.label, done ?? this.done);
  }
}
