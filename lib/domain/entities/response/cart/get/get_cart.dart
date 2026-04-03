class GetCart {
  final String? id;
  final String? cartOwner;
  final List<GetCart>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  GetCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
