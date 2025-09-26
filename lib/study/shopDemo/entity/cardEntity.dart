import 'package:fluttertest/study/shopDemo/entity/goodEntity.dart';

class CardEntity extends GoodEntity {
  int count = 1;

  CardEntity(
      {required super.name,
      required super.price,
      required super.desc,
      required super.path});

  CardEntity.add(GoodEntity g, {this.count = 1})
      : super(name: g.name, price: g.price, desc: g.desc, path: g.path);
}
