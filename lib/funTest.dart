// 函数别名
typedef Add = int Function(int, int);

void main() {
  Function fun = test;
  Function(int, int) fun2 = test;
  int Function(int, int) fun3 = test;
  fun(1, 2);
  // 自调用函数
  () {
    print("print");
  }();
  // 高阶函数
  add(() => print("88888"));
  addM((a, b) => a + b);
  Add fn() {
    return (a, b) {
      return a - b;
    };
  }

  int t = fn()(3, 4);
  print(t);
}

void add(Function fn) {
  fn();
}

void addM(Add fn) {
  int res = fn(7, 8);
  print("res= $res");
}

int test(int a, int b) {
  return a + b;
}

void f1(int? a, int? b) {}
// 位置可选参数
void pos(int? a, [int? b, int? c = 100, int d = 10]) {}
var p = pos(100, 200);
// 命名可选参数
void pos2(int? a, {int? b, int? c = 100,int d=1,required int? e}) {}
var p2 = pos2(100, b: 10, e: null);
