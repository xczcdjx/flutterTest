import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entity/todo_cls.dart';

/// 泛型 Hive 工具类，支持 TypeAdapter 对象存储
class HiveUtilTypeAdapter {
  HiveUtilTypeAdapter._internal();
  static final HiveUtilTypeAdapter _instance = HiveUtilTypeAdapter._internal();
  factory HiveUtilTypeAdapter() => _instance;

  static final Map<String, Box> _boxes = {};

  /// 初始化 Hive 并注册 Adapter
  /// adapters: Map<typeId, TypeAdapter>
  /*static Future<void> init({required Map<int, TypeAdapter> adapters}) async {
    await Hive.initFlutter();

    adapters.forEach((_, adapter) {
      Hive.registerAdapter(adapter);
    });
  }*/
  static Future<void> init({required Map<Type, TypeAdapter> adapters}) async {
    await Hive.initFlutter();

    adapters.forEach((type, adapter) {
      if (type == TodoCls) {
        Hive.registerAdapter<TodoCls>(adapter as TypeAdapter<TodoCls>);
      }
      // 可以扩展更多类型
    });
  }


  /// 打开 Box
  static Future<Box<T>> openBox<T>(String boxName) async {
    if (!_boxes.containsKey(boxName) || !_boxes[boxName]!.isOpen) {
      final box = await Hive.openBox<T>(boxName);
      _boxes[boxName] = box;
    }
    return _boxes[boxName] as Box<T>;
  }

  /*static Future<void> setList<T extends HiveObject>(String boxName, List<T> list) async {
    final box = await openBox<T>(boxName);
    await box.clear();
    for (var item in list) {
      await box.put(item.key, item); // HiveObject 的 key
    }
  }

  static Future<List<T>> getList<T extends HiveObject>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList().cast<T>();
  }*/

  /// 存储列表（支持任意 HiveObject，只要提供 keyExtractor）
  static Future<void> setList<T extends HiveObject>(
      String boxName,
      List<T> list, {
        required dynamic Function(T item) keyExtractor,
      }) async {
    final box = await openBox<T>(boxName);
    await box.clear();
    for (var item in list) {
      final key = keyExtractor(item);
      if (key is! String && key is! int) {
        throw HiveError("Key must be a String or int, got ${key.runtimeType}");
      }
      await box.put(key, item);
    }
  }

  /// 读取整个列表
  static Future<List<T>> getList<T extends HiveObject>(String boxName) async {
    final box = await openBox<T>(boxName);
    return box.values.toList().cast<T>();
  }



  /// 删除整个 Box
  static Future<void> deleteBox(String boxName) async {
    if (_boxes.containsKey(boxName)) {
      await _boxes[boxName]!.deleteFromDisk();
      _boxes.remove(boxName);
    }
  }

  /// 删除某个 Key
  static Future<void> deleteKey(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// 根据主键读取单个对象
  static Future<T?> getByKey<T>(
      String boxName,
      dynamic key,
      ) async {
    final box = await openBox<T>(boxName);
    return box.get(key);
  }

  /// 删除某个对象（通过主键）
  static Future<void> deleteByKey<T>(
      String boxName,
      dynamic key,
      ) async {
    final box = await openBox<T>(boxName);
    await box.delete(key);
  }
}
