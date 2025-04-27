import 'package:e_commerce_app/data/model/CategoryOrBrandResponseDm.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm(
      {super.results,
      super.metadata,
      super.data,
      this.statusMsg,
      this.message});

  ProductResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? ProductMetadataDm.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDm.fromJson(v));
      });
    }
  }

  String? statusMsg;
  String? message;
}

class ProductDm extends ProductEntity {
  ProductDm({
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
  });

  ProductDm.fromJson(dynamic json) {
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
    id = json['id'];
  }
}

class SubcategoryDm extends SubcategoryEntity {
  SubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  SubcategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class ProductMetadataDm extends ProductMetadataEntity {
  ProductMetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  ProductMetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    map['nextPage'] = nextPage;
    return map;
  }
}
