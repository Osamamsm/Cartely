import 'package:e_commerce/core/supabase/supabase_service.dart';
import 'package:e_commerce/features/reviews/data/models/product_review_model.dart';
import 'package:e_commerce/features/reviews/data/models/reviewable_product_model.dart';
import 'package:e_commerce/features/reviews/data/models/user_review_model.dart';
import 'package:e_commerce/features/reviews/data/review_operation_result_model.dart';
import 'package:injectable/injectable.dart';

abstract class ReviewsRemoteDataSource {
  Future<ReviewOperationResultModel> addReview({
    required String productId,
    required String comment,
    required double rating,
  });

  Future<ReviewOperationResultModel> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  });

  Future<ReviewOperationResultModel> deleteReview({required String reviewId});

  Future<List<UserReviewModel>> getUserReviews({required int page});

  Future<List<ProductReviewModel>> getProductReviews({
    required String productId,
    double? ratingFilter,
    required int page,
  });

  Future<List<ReviewableProductModel>> getReviewableProducts({
    required int page,
  });
}

@LazySingleton(as: ReviewsRemoteDataSource)
class ReviewsRemoteDataSourceImpl implements ReviewsRemoteDataSource {
  final SupabaseService _supabaseService;

  ReviewsRemoteDataSourceImpl(this._supabaseService);
  @override
  Future<ReviewOperationResultModel> addReview({
    required String productId,
    required String comment,
    required double rating,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'add_review',
      params: {
        'p_product_id': productId,
        'p_comment': comment,
        'p_rating': rating,
      },
    );

    return ReviewOperationResultModel.fromJson(response.data);
  }

  @override
  Future<ReviewOperationResultModel> deleteReview({
    required String reviewId,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'delete_review',
      params: {'p_review_id': reviewId},
    );
    return ReviewOperationResultModel.fromJson(response.data);
  }

  @override
  Future<ReviewOperationResultModel> editReview({
    required String reviewId,
    required String comment,
    required double rating,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'edit_review',
      params: {
        'p_review_id': reviewId,
        'p_comment': comment,
        'p_rating': rating,
      },
    );
    return ReviewOperationResultModel.fromJson(response.data);
  }

  @override
  Future<List<ProductReviewModel>> getProductReviews({
    required String productId,
    double? ratingFilter,
    required int page,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'get_product_reviews',
      params: {
        'p_product_id': productId,
        'p_rating_filter': ratingFilter,
        'p_page': page,
      },
    );
    return (response.data as List)
        .map((e) => ProductReviewModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ReviewableProductModel>> getReviewableProducts({
    required int page,
  }) async {
    final response = await _supabaseService.rpc(
      function: 'get_reviewable_products',
      params: {'p_page': page},
    );
    return (response.data as List)
        .map((e) => ReviewableProductModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<UserReviewModel>> getUserReviews({required int page}) async {
    final response = await _supabaseService.rpc(
      function: 'get_user_reviews',
      params: {'p_page': page},
    );
    return (response.data as List)
        .map((e) => UserReviewModel.fromJson(e))
        .toList();
  }
}
