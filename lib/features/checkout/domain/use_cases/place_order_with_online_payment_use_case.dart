import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';
import 'package:e_commerce/features/checkout/domain/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceOrderWithOnlinePaymentUseCase {
  final CheckoutRepo _checkoutRepo;

  PlaceOrderWithOnlinePaymentUseCase(this._checkoutRepo);

  Future<Either<Failure, PlaceOrderResult>> call({
    required String addressId,
    required String paymentMethod,
  }) async {
    return await _checkoutRepo.placeOrderWithOnlinePayment(
      addressId: addressId,
      paymentMethod: paymentMethod,
    );
  }
}
