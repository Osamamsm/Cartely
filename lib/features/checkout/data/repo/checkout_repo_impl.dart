import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/checkout/data/data_source/checkout_remote_data_source.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';
import 'package:e_commerce/features/checkout/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDataSource _remoteDataSource;

  CheckoutRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, PlaceOrderResult>> placeOrderCashOnDelivery({
    required String addressId,
  }) async {
    try {
      final result = await _remoteDataSource.placeOrderCashOnDelivery(
        addressId: addressId,
      );
      return Right(result.toEntity());
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
