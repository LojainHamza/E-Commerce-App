import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
}
