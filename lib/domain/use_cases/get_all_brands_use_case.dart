import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}
