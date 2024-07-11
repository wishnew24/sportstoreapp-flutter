class Order {
  final int id;
  final int productId;
  final int userId;
  final int quantity;

  Order({
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'quantity': quantity,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      productId: json['productId'],
      userId: json['userId'],
      quantity: json['quantity'],
    );
  }
}
