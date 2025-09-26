class GoodEntity {
  String name;
  String price;
  String desc;
  String path;

  GoodEntity(
      {required this.name,
      required this.price,
      required this.desc,
      required this.path});
}

final goodList = [
  GoodEntity(
      name: "Angular",
      price: "3.11",
      desc: "应用程序设计框架和开发平台，用于创建高效且复杂的单页应用程序",
      path: "https://cdn.docschina.org/home/logo/angular.svg"),
  GoodEntity(
      name: "React",
      price: "6.11",
      desc: "构建用户界面的 JavaScript 库",
      path: "https://cdn.docschina.org/home/logo/react.svg"),
  GoodEntity(
      name: "Vue",
      price: "10.11",
      desc: "渐进式 JavaScript 框架",
      path: "https://cdn.docschina.org/home/logo/vue.svg"),
];
