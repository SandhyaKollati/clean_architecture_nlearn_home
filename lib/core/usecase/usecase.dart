import 'package:dartz/dartz.dart';
import 'package:nlearn_v3_home/core/network/api_result.dart';

abstract class UseCase<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}