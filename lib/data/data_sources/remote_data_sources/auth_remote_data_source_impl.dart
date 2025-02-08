import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/data_sources/remote_data_sources/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }
}