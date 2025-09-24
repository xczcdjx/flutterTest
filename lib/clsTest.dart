class Per{
  final String name;
  final int age;
  static int b=100;
  static const int c=100;
  const Per(this.name,this.age);
  Per.init(this.age,this.name);
}
//  构造位置，命名函数
class Per2{
  String n;
  int ? age;
  // Per2({required this.n,this.age});
  Per2([this.n='',this.age]);
}
class Worker extends Per2{
  Worker([super.n='xxx']);
  // Worker({required super.n,super.age});
}
void main(){
  var p=const Per("张三", 18);
  var p2=const Per("张三", 18);
  var p3=Per.init(11, "李四");
  var p4=Per.init(11, "李四");
  print(p3.hashCode==p4.hashCode);
  print(identical(p, p2));
}