class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
  static List<Item> items;

  //Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map['id'],
        name: map['name'],
        desc: map['desc'],
        price: map['price'],
        color: map['color'],
        image: map['image']);
  }
}
