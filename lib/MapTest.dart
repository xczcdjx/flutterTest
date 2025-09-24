void main() {
  var m = Map<int, String>();
  m[0] = "3213";
  m[1] = "312";
  var m2 = Map();
  m2["name"] = "张三";
  m2["age"] = 18;
  int a = m2["age"];
  var n = m2["name"] as String;
  print('n=${n.length}');
  // 字面量创建
  var obj = <String,dynamic>{"hh":"3333"};
  obj.addEntries([
    MapEntry("gender", 'male'),
    MapEntry("age", 18),
  ]);
  print(obj);
  var res=obj.map((k,v)=>MapEntry(k, "444465"));
  print(res);
  // entries.map //可以返回任何类型
  var it1=obj.entries.map((e){
    return e.key+"2432";
  });
  print('it1 ${it1.toList()}');
  // List转Map
  it1.toList().asMap();
  var num=List.generate(10, (i)=>i+1);
  var nnum=num.asMap().entries.map((m){
    print("k=${m.key},v=${m.value}");
    return m.value;
  }).toList();
  print(nnum);
}
