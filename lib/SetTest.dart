void main(){
  Set<int> s=new Set<int>();
  s.add(1);
  s.add(2);
  s.add(1);
  s.add(3);
  print(s);
  var s2=Set();
  Set<String> s3={};
  // Set.from可以用一个数组初始化Set
  var s4=Set<int>.from([2,3,4,6,2,3,6]);
  // 可以用另一个Set初始化Set
  var s5=Set.from(s4);
  print(s4);
  for (var value in s5) {
    print("item: $value");
  }
  // 类型别名
  dynamic str="hello";
  var t2=str as String;
  print("t2 Len=${t2.length}");
}