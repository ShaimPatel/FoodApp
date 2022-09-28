class ReviewCartModel {
  final String cartId;
  final String cartImage;
  final String cartName;
  final int cartPrice;
  final int cartQuantity;
  final String productWeight;

  ReviewCartModel({
    required this.productWeight,
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
  });
}
