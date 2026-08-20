import 'package:e_commerce/features/wish_list/data/repos/wishlist_repo.dart';
import 'package:e_commerce/features/wish_list/presentation/logic/get_wish_list_cubit/get_wish_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetWishListCubit extends Cubit<GetWishlistState> {
  final WishListRepo _wishlistRepo;

  GetWishListCubit(this._wishlistRepo) : super(GetWishlistState());

  int _currentPage = 1;

  final int _pageSize = 10;

  Future<void> getWishList() async {
    emit(state.copyWith(status: WishlistStatus.loading));
    final result = await _wishlistRepo.getWishList(page: _currentPage);
    result.fold(
      (failure) => emit(
        (state.copyWith(
          errMessage: failure.message,
          status: WishlistStatus.failed,
        )),
      ),
      (products) => emit(
        (state.copyWith(products: products, status: WishlistStatus.loaded)),
      ),
    );
  }

  void removeIfNotInWishlist(Set<String> wishListedIds) {
    final currentState = state;
    if (currentState.status != WishlistStatus.loaded) return;

    final updated = currentState.products
        .where((p) => wishListedIds.contains(p.id))
        .toList();

    if (updated.length != currentState.products.length) {
      emit(state.copyWith(products: updated, status: WishlistStatus.loaded));
    }
  }

  Future<void> loadMoreProducts() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = _currentPage + 1;

    final result = await _wishlistRepo.getWishList(page: nextPage);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoadingMore: false,
            errMessage: failure.message,
            status: WishlistStatus.failed,
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
