import 'package:e_commerce/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrdersCubit extends Cubit<GetOrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;
  GetOrdersCubit(this._getOrdersUseCase) : super(GetOrdersInitial());

  Future<void> getOrders({
    String? orderStatusFilter,
    String? searchQuery,
  }) async {
    emit(GetOrdersLoading());
    final result = await _getOrdersUseCase.call(
      orderStatusFilter: orderStatusFilter,
      searchQuery: searchQuery,
    );
    result.fold(
      (failure) => emit(GetOrdersFailure(message: failure.message)),
      (orders) => emit(GetOrdersSuccess(orders: orders)),
    );
  }
}
