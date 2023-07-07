class ProductEntity {
  final int id;
  final String name;

  final double weight;
  final int price;

  final int? salePrice;
  final String image;

  final bool isFavourite;
  final bool isTop;

  const ProductEntity({
    this.id = 0,
    this.image = '',
    this.isFavourite = false,
    this.isTop = false,
    this.name = '',
    this.price = 0,
    this.salePrice,
    this.weight = 0,
  });
}
