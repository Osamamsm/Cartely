import 'package:equatable/equatable.dart';

enum ConfirmationStatus { confirming, confirmed, failed, timeout }

class PaymentConfirmationState extends Equatable {
  const PaymentConfirmationState({
    this.status = ConfirmationStatus.confirming,
    this.orderNumber,
    this.orderId
  });

  final ConfirmationStatus status;
  final String? orderNumber;
  final String? orderId;

  PaymentConfirmationState copyWith({
    ConfirmationStatus? status,
    String? orderNumber,
    String? orderId
  }) {
    return PaymentConfirmationState(
      status: status ?? this.status,
      orderNumber: orderNumber ?? this.orderNumber,
      orderId: orderId ?? this.orderId
    );
  }

  @override
  List<Object?> get props => [status, orderNumber];
}
