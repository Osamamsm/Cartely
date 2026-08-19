import 'package:e_commerce/features/product/data/models/product_details.dart';
import 'package:e_commerce/features/product/domain/repos/product_repo.dart';
import 'package:e_commerce/features/product/product_details/presentation/logic/product_details_cubit/product_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductRepo _productRepo;

  ProductDetailsCubit(this._productRepo) : super(ProductDetailsInitial());

  Future<void> loadProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    final details = await _productRepo.getProductDetails(productId);
    details.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) => emit(
        ProductDetailsLoaded(
          product: product,
          selectedOptions: _defaultSelectionFor(product),
        ),
      ),
    );
  }

  Map<String, String> _defaultSelectionFor(ProductDetails product) {
    if (product.productItems.isEmpty) return {};

    final defaultItem = product.productItems.firstWhere(
      (item) => item.stock > 0,
      orElse: () => product.productItems.first,
    );

    final selection = {
      for (final v in defaultItem.variations) v.variationEn: v.optionEn,
    };
    print('DEFAULT ITEM: ${defaultItem.id}');
    print('DEFAULT VARIATIONS: ${defaultItem.variations}');
    print('DEFAULT SELECTION: $selection');

    return selection;
  }

  void selectOption(String variationEn, String optionEn) {
    final current = state;
    if (current is! ProductDetailsLoaded) return;

    final updated = Map<String, String>.from(current.selectedOptions)
      ..[variationEn] = optionEn;

    final matching = current.product.productItems.where(
      (item) => updated.entries.every((e) => item.optionFor(e.key) == e.value),
    );

    // Clear downstream selections that no longer exist for the new combination
    if (matching.isEmpty) {
      final matchingItems = current.product.productItems.where(
        (item) => item.variations.any(
          (v) => v.variationEn == variationEn && v.optionEn == optionEn,
        ),
      );
      final firstItemWithOption = matchingItems.isNotEmpty
          ? matchingItems.first
          : null;

      if (firstItemWithOption != null) {
        // Reset to just this one variation
        updated.clear();
        for (final v in firstItemWithOption.variations) {
          updated[v.variationEn] = v.optionEn;
        }
      }
    }

    emit(current.copyWith(selectedOptions: updated));
  }
}
