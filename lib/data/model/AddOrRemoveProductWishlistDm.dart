import 'package:e_commerce_app/domain/entities/AddOrRemoveProductWishlistEntity.dart';

class AddOrRemoveProductWishlistDm extends AddOrRemoveProductWishlistEntity {
  AddOrRemoveProductWishlistDm({
    super.status,
    this.statusMsg,
    super.message,
    super.data,
  });

  AddOrRemoveProductWishlistDm.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
