import 'package:e_commerce_app/data/model/ProductResponseDm.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDm extends GetCartResponseEntity {
  GetCartResponseDm({
    this.statusMsg,
    this.message,
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
  });

  GetCartResponseDm.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetDataDm.fromJson(json['data']) : null;
  }

  String? message;
  String? statusMsg;
}

class GetDataDm extends GetDataEntity {
  GetDataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductDm extends GetProductEntity {
  GetProductDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product =
        json['product'] != null ? ProductDm.fromJson(json['product']) : null;
    price = json['price'];
  }
}
