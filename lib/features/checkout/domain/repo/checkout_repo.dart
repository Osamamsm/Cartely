import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';

abstract class CheckoutRepo {
  Future<Either<Failure,PlaceOrderResult>> placeOrderCashOnDelivery({
    required String addressId,
  });
}
