import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/data/model/AddOrRemoveProductWishlistDm.dart';
import 'package:e_commerce_app/data/model/GetUserWishlistResponseDm.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/wishlist_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WishlistRemoteDataSource)
class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  ApiManager apiManager;

  WishlistRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetUserWishlistResponseDm>> getUserWishlist() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.getData(
            endPoint: EndPoints.getUserWishlist, headers: {'token': token});
        var userWishlistResponse =
            GetUserWishlistResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(userWishlistResponse);
        } else {
          return Left(ServerError(errorMessage: userWishlistResponse.message!));
        }
      } else {
        //todo: no internet
        return Left(NetworkError(errorMessage: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddOrRemoveProductWishlistDm>> addProductToWishlist(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(
            endPoint: EndPoints.getUserWishlist,
            headers: {'token': token},
            body: {'productId': productId});
        var addToWishlistResponse =
            AddOrRemoveProductWishlistDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(addToWishlistResponse);
        } else {
          return Left(
              ServerError(errorMessage: addToWishlistResponse.message!));
        }
      } else {
        //todo: no internet
        return Left(NetworkError(errorMessage: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddOrRemoveProductWishlistDm>>
      removeProductFromWishlist(String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData(
          endPoint: '${EndPoints.getUserWishlist}/$productId',
          headers: {'token': token},
        );
        var removeFromWishlistResponse =
            AddOrRemoveProductWishlistDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(removeFromWishlistResponse);
        } else {
          return Left(
              ServerError(errorMessage: removeFromWishlistResponse.message!));
        }
      } else {
        //todo: no internet
        return Left(NetworkError(errorMessage: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
