import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';
import 'package:e_commerce/features/checkout/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceOrderCashOnDeliveryUseCase {
  final CheckoutRepo _checkoutRepo;

  PlaceOrderCashOnDeliveryUseCase(this._checkoutRepo);

  Future<Either<Failure, PlaceOrderResult>> call({
    required String addressId,
  }) async {
    return await _checkoutRepo.placeOrderCashOnDelivery(addressId: addressId);
  }
}
