import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

class CategoryResponseDm extends CategoryResponseEntity {
  String? message;
  String? statusMsg;

  CategoryResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMsg,
  });

  CategoryResponseDm.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    results = json['results'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryDm.fromJson(v));
      });
    }
  }
}

class CategoryDm extends CategoryEntity {
  CategoryDm(
      {super.id,
      super.name,
      super.slug,
      super.image,
      this.createdAt,
      this.updatedAt});

  CategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? createdAt;
  String? updatedAt;
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
