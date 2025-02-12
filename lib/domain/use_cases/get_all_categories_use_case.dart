import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeRepository homeRepository;

  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return homeRepository.getAllCategories();
  }
}
