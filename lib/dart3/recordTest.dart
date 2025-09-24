void main() {
  Record r = (12, 333);
  print(r.runtimeType);
  (int, int) r1 = (124, 333);
  /*print(r1.$1);
  print(r1.$2);*/
  var r2 = (888, 999);
  // 命名字段
  var r3 = (a: 888, b: 999);
  // 位置字段
  var r4 = (a: 888, b: 999, 300, 400);
  // print(r2.$1);
  // print(r2.$2);
  print(r4.$1);
  print(r4.a);
  // 带命名字段
  // 命名字段
  var r55 = (a: 888, b: 999);
  ({int a, int b}) r5 = (a: 100, b: 200);
  print('a ${r5.a}');
  // 带位置字段
  var r77 = (888, 999);
  (int a, int b) r7 = (200, 300);
  print('r7 ${r7.$1}');
  // 命名字段不一样不能赋值
  ({int a, int b}) r8 = (a: 200, b: 300);
  //
  // Record相等性
  ({int a, int b}) ra1 = (a: 200, b: 300);
  ({int a, int b}) ra2 = (a: 200, b: 300);
  (int age, int age2) ra3 = (200, 300);
  (int a2, int a3) ra4 = (200, 300);
  print(ra1 == ra2);
  print(ra1 == ra3);
  print(ra4 == ra3);
  // 解构
  var (t, b) = (100, 200);

  var [f,s,th,_]=[100,200,300,400];
  var {'page':p,'size':si}={'page':2,'size':10};
}
