enum Color { red, yellow, blue }
// 构造器枚举
enum Person {
  child(h: 20, w: 5),
  man(h: 100, w: 60),
  woman(h: 90, w: 50);

  final int h;
  final int w;

  const Person({required this.h, required this.w});
}

void main() {
  var c = Color.red;
  print('c=$c');
  print('c=${c.index}');
  int a = 20;
  switch (a) {
    case 10:
      print("1111");
    case 20:
      print("2222");
      break;
    default:
      print("3333");
  }
  Color color = Color.red;
  switch (color) {
    case Color.red:
      print("red");
    case Color.yellow:
      print("red");
    case Color.blue:
      print("red");
  }
  // switch表达式
  var t = switch (a) { 10 => 10, 20 => 20, _ => 99 };
}
