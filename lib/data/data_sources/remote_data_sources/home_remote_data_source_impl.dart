import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/data/model/CategoryResponseDm.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/home_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseDm>> getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response =
            await apiManager.getData(endPoint: EndPoints.getAllCategories);
        var homeResponse = CategoryResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(homeResponse);
        } else {
          return Left(ServerError(errorMessage: homeResponse.message!));
        }
      } else {
        //todo: no internet
        return Left(NetworkError(errorMessage: 'No Internet Connection'));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
