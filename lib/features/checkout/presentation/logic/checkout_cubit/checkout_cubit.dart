import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());

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
}
