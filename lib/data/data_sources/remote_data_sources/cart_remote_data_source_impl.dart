import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/cache/shared_preference_utils.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/data/model/CartResponseDm.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/cart_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CartResponseDm>> getItemInCart() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.getData(
            endPoint: EndPoints.addProductToCart, headers: {'token': token});
        var getCartResponse = CartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerError(errorMessage: getCartResponse.message!));
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
  Future<Either<Failures, CartResponseDm>> deleteItemsInCart(
      String productId) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData(
            endPoint: '${EndPoints.addProductToCart}/$productId',
            headers: {'token': token});
        var deleteCartResponse = CartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteCartResponse);
        } else {
          return Left(ServerError(errorMessage: deleteCartResponse.message!));
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
  Future<Either<Failures, CartResponseDm>> updateCountInCart(
      String productId, int count) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.updateData(
            endPoint: '${EndPoints.addProductToCart}/$productId',
            headers: {'token': token},
            body: {'count': '$count'});
        var updateCountResponse = CartResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCountResponse);
        } else {
          return Left(ServerError(errorMessage: updateCountResponse.message!));
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
