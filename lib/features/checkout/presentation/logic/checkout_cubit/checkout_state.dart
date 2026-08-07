import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';

class CheckoutState {
  final AddressEntity? selectedAddress;
  final PaymentType? selectedPaymentType;
  final Cart? cart;

  CheckoutState({this.selectedAddress, this.selectedPaymentType, this.cart});

  CheckoutState copyWith({
    AddressEntity? selectedAddress,
    PaymentType? selectedPaymentType,
    Cart? cart,
  }) {
    return CheckoutState(
      selectedAddress: selectedAddress ?? this.selectedAddress,
      selectedPaymentType: selectedPaymentType ?? this.selectedPaymentType,
      cart: cart ?? this.cart,
    );
  }
}
