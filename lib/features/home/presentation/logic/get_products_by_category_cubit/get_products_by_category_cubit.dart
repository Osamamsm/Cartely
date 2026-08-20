import 'package:e_commerce/features/home/presentation/logic/get_products_by_category_cubit/get_products_by_category_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  final ProductRepo _productRepo;
  GetProductsByCategoryCubit(this._productRepo)
    : super(GetProductsByCategoryState());

  int _currentPage = 1;

  final int _pageSize = 10;

  Future<void> getProductsByCategory(String categoryId) async {
    _currentPage = 1;
    emit(
      state.copyWith(status: ProductsStatus.loading, categoryId: categoryId),
    );
    final result = await _productRepo.getProductsByCategory(
      categoryId: categoryId,
      page: _currentPage,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          errMessage: failure.message.toString(),
          status: ProductsStatus.failed,
        ),
      ),
      (products) => emit(
        state.copyWith(products: products, status: ProductsStatus.loaded),
      ),
    );
  }

  Future<void> loadMoreProducts() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = _currentPage + 1;

    final result = await _productRepo.getProductsByCategory(
      categoryId: state.categoryId!,
      page: nextPage,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            errMessage: failure.message,
            status: ProductsStatus.failed,
          ),
        );
      },
      (newProducts) {
        _currentPage = nextPage;
        emit(
          state.copyWith(
            products: [...state.products, ...newProducts],
            isLoadingMore: false,
            hasMore: newProducts.length >= _pageSize,
          ),
        );
      },
    );
  }
}
