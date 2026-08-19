import 'dart:async';
import 'package:e_commerce/features/checkout/presentation/logic/payment_confirmation_cubit/payment_confirmation_state.dart';
import 'package:e_commerce/features/orders/domain/repo/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@injectable
class PaymentConfirmationCubit extends Cubit<PaymentConfirmationState> {
  PaymentConfirmationCubit(
    this._ordersRepo,
    this._supabase,
    @factoryParam this.orderId,
  ) : super(const PaymentConfirmationState()) {
    _start();
  }

  final OrdersRepo _ordersRepo;
  final SupabaseClient _supabase;
  final String orderId;

  RealtimeChannel? _orderChannel;
  Timer? _timeoutTimer;

  static const _confirmationTimeout = Duration(seconds: 90);

  void _start() {
    _orderChannel = _supabase
        .channel('order-$orderId')
        .onPostgresChanges(
          event: PostgresChangeEvent.update,
          schema: 'public',
          table: 'orders',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'id',
            value: orderId,
          ),
          callback: (_) => _checkStatus(),
        )
        .subscribe();

    _checkStatus();
    _timeoutTimer = Timer(_confirmationTimeout, _handleTimeout);
  }

  Future<void> _checkStatus() async {
    final result = await _ordersRepo.getOrderDetailsById(orderId: orderId);

    result.fold((failure) => null, (order) {
      if (order.paymentStatus == 'paid') {
        _cleanup();
        emit(
          state.copyWith(
            status: ConfirmationStatus.confirmed,
            orderNumber: order.orderNumber,
            orderId: order.orderId
          ),
        );
      } else if (order.paymentStatus == 'failed') {
        _cleanup();
        emit(state.copyWith(status: ConfirmationStatus.failed));
      }
    });
  }

  void _handleTimeout() {
    if (state.status != ConfirmationStatus.confirming) return;
    _cleanup();
    emit(state.copyWith(status: ConfirmationStatus.timeout));
  }

  void _cleanup() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    _orderChannel?.unsubscribe();
    _orderChannel = null;
  }

  @override
  Future<void> close() {
    _cleanup();
    return super.close();
  }
}
