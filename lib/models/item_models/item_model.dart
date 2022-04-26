class Item {
  int? id;
  int? catId;
  String? title;
  String? unit;
  int? stock;
  String? imageUrl;
  double? price;
  int? qty;

  Item(
      {required this.id,
      required this.catId,
      required this.imageUrl,
      required this.price,
      required this.title,
      required this.unit,
      required this.stock,
      required this.qty});
}
