import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';
import 'package:e_commerce/features/checkout/domain/use_cases/place_order_cash_on_delivery_use_case.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final PlaceOrderCashOnDeliveryUseCase _placeOrderCashOnDeliveryUseCase;
  CheckoutCubit(this._placeOrderCashOnDeliveryUseCase)
    : super(CheckoutState.initial());

  void initDefaults({required Cart cart}) {
    emit(
      state.copyWith(
        cart: cart,
        selectedPaymentType: PaymentType.cashOnDelivery,
      ),
    );
  }

  void setAddress(AddressEntity address) {
    emit(state.copyWith(selectedAddress: address));
  }

  void setPaymentMethod({required PaymentType paymentType}) {
    emit(state.copyWith(selectedPaymentType: paymentType));
  }

  Future<void> placeOrder(String addressId, PaymentType paymentType) async {
    emit(state.copyWith(orderStatus: OrderStatus.loading));
    switch (paymentType) {
      case PaymentType.cashOnDelivery:
        final result = await _placeOrderCashOnDeliveryUseCase.call(
          addressId: addressId,
        );
        result.fold(
          (failure) {
            emit(
              state.copyWith(
                orderStatus: OrderStatus.failure,
                message: failure.message,
              ),
            );
          },
          (placeOrderResult) {
            if (placeOrderResult is PlacedOrder) {
              emit(
                state.copyWith(
                  orderStatus: OrderStatus.orderPlaced,
                  placedOrder: placeOrderResult,
                ),
              );
            } else if (placeOrderResult is PlaceOrderRejected) {
              emit(
                state.copyWith(
                  orderStatus: OrderStatus.orderRejected,
                  message: placeOrderResult.message,
                ),
              );
            }
          },
        );
        break;
      case PaymentType.card:
        break;
      case PaymentType.digitalWallet:
    }
  }
}
