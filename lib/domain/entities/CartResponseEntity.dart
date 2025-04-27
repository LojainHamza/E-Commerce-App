import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class CartResponseEntity {
  CartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });

  String? status;
  num? numOfCartItems;
  String? cartId;
  CartDataEntity? data;
}

class CartDataEntity {
  CartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<CartProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class CartProductEntity {
  CartProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  ProductEntity? product;
  num? price;
}
