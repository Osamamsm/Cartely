import 'package:e_commerce/features/home/presentation/logic/product_feed_cubit/product_feed_state.dart';
import 'package:e_commerce/features/home/presentation/widgets/filters/product_filter_state.dart';
import 'package:e_commerce/features/product/data/models/products_query_params.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductFeedCubit extends Cubit<ProductFeedState> {
  final ProductRepo _productRepo;
  ProductsQueryParams _currentParams = ProductsQueryParams.initial();

  ProductFeedCubit(this._productRepo) : super(ProductFeedState());

  int _currentPage = 1;

  final int _pageSize = 10;

  Future<void> setFilters(ProductFilterState filters) async {
    _currentParams = ProductsQueryParams.fromFilterState(
      filters,
      categoryId: _currentParams.categoryId,
      page: _currentPage,
    );
    await loadProducts();
  }

  Future<void> refresh() => loadProducts();

  Future<void> loadProducts() async {
    emit(state.copyWith(status: ProductsStatus.loading));
    final result = await _productRepo.getProducts(_currentParams);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: ProductsStatus.failed,
          errMessage: failure.message.toString(),
        ),
      ),
      (products) => emit(
        state.copyWith(status: ProductsStatus.loaded, products: products),
      ),
    );
  }

  Future<void> loadMoreProducts() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = _currentPage + 1;

    final result = await _productRepo.getProducts(
      _currentParams.copyWith(page: nextPage),
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
