import 'package:e_commerce_app/data/model/CategoryOrBrandResponseDm.dart';
import 'package:e_commerce_app/data/model/ProductResponseDm.dart';
import 'package:e_commerce_app/domain/entities/GetUserWishlistResponseEntity.dart';

class GetUserWishlistResponseDm extends GetUserWishlistResponseEntity {
  GetUserWishlistResponseDm(
      {super.status, super.count, super.data, this.statusMsg, this.message});

  String? statusMsg;
  String? message;

  GetUserWishlistResponseDm.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(UserWishlistDm.fromJson(v));
      });
    }
  }
}

class UserWishlistDm extends UserWishlistEntity {
  UserWishlistDm({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  UserWishlistDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDm.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandDm.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandDm.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}
