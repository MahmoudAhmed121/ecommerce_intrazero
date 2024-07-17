// import 'package:cloud_firestore/cloud_firestore.dart';


// class CartModel  {
//   final List<CartItem> items;
//   late double? totalAmount;

//   CartModel({
//     required this.items,
//     this.totalAmount,
//   });

//   factory CartModel.fromJson(Map<String, dynamic> json) {
//     return CartModel(
//       items: (json['items'] as List)
//           .map((item) => CartItem.fromJson(item))
//           .toList(),
//       totalAmount: json['totalAmount'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'items': items.map((item) => item.toJson()).toList(),
//       'totalAmount': totalAmount,
//     };
//   }

//   CartModel copyWith({
//     List<CartItem>? items,
//     double? totalAmount,
//   }) {
//     return CartModel(
//       items: items ?? this.items,
//       totalAmount: totalAmount ?? this.totalAmount,
//     );
//   }

//   @override
//   List<Object?> get props => [items, totalAmount];
// }

// class CartItem  {
//   final String productId;
//   late ProductModel? product;
//   late DateTime? createdAt;
//   late int? quantity;
//   late String? storeId;

//   CartItem({
//     required this.productId,
//     this.product,
//     this.createdAt,
//     this.quantity,
//     this.storeId,
//   });

//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       productId: json['productId'],
//       quantity: json['quantity'],
//       createdAt: json['createdAt'] != null
//           ? (json['createdAt'] as Timestamp).toDate()
//           : null,
//       storeId: json['storeId'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : null,
//       'quantity': quantity,
//       'storeId': storeId,
//     };
//   }

//   CartItem copyWith({
//     String? productId,
//     ProductModel? product,
//     int? quantity,
//     DateTime? createdAt,
//     String? storeId,
//     String? categoryName,
//   }) {
//     return CartItem(
//       productId: productId ?? this.productId,
//       product: product ?? this.product,
//       createdAt: createdAt ?? this.createdAt,
//       quantity: quantity ?? this.quantity,
//       storeId: storeId ?? this.storeId,
//     );
//   }

//   @override
//   List<Object?> get props => [productId, product, createdAt, storeId];
// }
