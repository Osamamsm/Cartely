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

  ProductFeedCubit(this._productRepo) : super(ProductFeedInitial());

  Future<void> setFilters(ProductFilterState filters) async {
    _currentParams = ProductsQueryParams.fromFilterState(
      filters,
      categoryId: _currentParams.categoryId,
    );
    await loadProducts();
  }

  Future<void> refresh() => loadProducts();

  Future<void> loadProducts() async {
    emit(ProductFeedLoading());
    final result = await _productRepo.getProducts(_currentParams);
    result.fold(
      (failure) => emit(ProductFeedError(failure.message.toString())),
      (products) => emit(ProductFeedLoaded(products)),
    );
  }
}
