void main(){
  List<int> arr=[];
  List<dynamic> arr2=[];
  var l0b=[];
  var t=<int>[];
  print(arr);
  arr.add(123);
  arr.addAll([2,4,6]);
  print(arr);
  l0b.add(2);
  l0b.add("3");
  l0b.insert(0, 88);
  l0b.insertAll(1, [3,4,6,8]);
  l0b.remove('3');
  l0b.removeAt(0);
  l0b.removeRange(0, 2); // [f,e)
  l0b.removeLast(); // 删除最后一个
  // 判断是否为空
  // l0b.isEmpty
  // l0b.isNotEmpty
  print(l0b);
  /*arr.forEach((int t){
    print(t);
  });*/
  // reversed
  // l0b.reversed;
  var tt=l0b.reversed.toList();
  var tt2=tt.map((i)=>i+1);
  print(tt2.toList());
  // 生成器
  List<String> sArr=List.generate(26, (i)=>String.fromCharCode(i+97));
  print(sArr);
  // 展开运算
  List<int> cc=[...[1,2,4],4,5,7];
  print([3,4,5,6,...List.generate(10, (i)=>i+7)]);
}