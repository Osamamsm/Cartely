import 'package:e_commerce/core/models/payment_method.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/cart/domain/entities/cart.dart';
import 'package:e_commerce/features/checkout/domain/entity/place_order_result.dart';

class CheckoutState {
  final AddressEntity? selectedAddress;
  final PaymentType? selectedPaymentType;
  final Cart? cart;
  final OrderStatus? orderStatus;
  final PlacedOrder? placedOrder;
  final String? message;


  CheckoutState({
    this.selectedAddress,
    this.selectedPaymentType,
    this.cart,
    this.orderStatus = OrderStatus.initial,
    this.placedOrder,
    this.message,
  });

  factory CheckoutState.initial() {
    return CheckoutState(
      selectedAddress: null,
      selectedPaymentType: null,
      cart: null,
    );
  }

  CheckoutState copyWith({
    AddressEntity? selectedAddress,
    PaymentType? selectedPaymentType,
    Cart? cart,
    OrderStatus? orderStatus,
    PlacedOrder? placedOrder,
    String? message,
  }) {
    return CheckoutState(
      selectedAddress: selectedAddress ?? this.selectedAddress,
      selectedPaymentType: selectedPaymentType ?? this.selectedPaymentType,
      cart: cart ?? this.cart,
      orderStatus: orderStatus ?? this.orderStatus,
      placedOrder: placedOrder ?? this.placedOrder,
      message: message ?? this.message
    );
  }
}

enum OrderStatus { initial, loading, orderPlaced, orderRejected, failure }
