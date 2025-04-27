import 'package:e_commerce_app/domain/entities/AddCartResponseEntity.dart';

class AddCartResponseDm extends AddCartResponseEntity {
  AddCartResponseDm(
      {super.status,
      super.message,
      this.statusMsg,
      super.numOfCartItems,
      super.cartId,
      super.data});

  AddCartResponseDm.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDm.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class DataDm extends DataEntity {
  DataDm({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  DataDm.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDm.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDm extends AddProductEntity {
  AddProductDm({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDm.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
