import 'package:e_commerce/features/home/presentation/logic/product_search_cubit/product_search_state.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductSearchCubit extends Cubit<ProductSearchState> {
  final ProductRepo _productRepo;
  ProductSearchCubit(this._productRepo) : super(ProductSearchState());

  int _currentPage = 1;

  final int _pageSize = 10;

  Future<void> searchProducts({
    required String query,
  }) async {
    _currentPage = 1;
    emit(state.copyWith(status: ProductsStatus.loading, query: query));
    final result = await _productRepo.searchProducts(
      query: query,
      page: _currentPage,
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductsStatus.failed,
          errMessage: failure.message,
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

    final result = await _productRepo.searchProducts(
      query: state.query!,
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
