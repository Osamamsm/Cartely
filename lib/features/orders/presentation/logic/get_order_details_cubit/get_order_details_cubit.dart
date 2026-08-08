import 'package:e_commerce/features/orders/domain/use_cases/get_order_details_use_case.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_order_details_cubit/get_order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderDetailsCubit extends Cubit<GetOrderDetailsState> {
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;
  GetOrderDetailsCubit(this._getOrderDetailsUseCase)
    : super(GetOrderDetailsInitial());

  Future<void> getOrderDetails({required String orderId}) async {
    emit(GetOrderDetailsLoading());
    final result = await _getOrderDetailsUseCase.call(orderId: orderId);
    result.fold(
      (failure) => emit(GetOrderDetailsFailure(message: failure.message)),
      (orderDetails) =>
          emit(GetOrderDetailsSuccess(orderDetails: orderDetails)),
    );
  }
}
