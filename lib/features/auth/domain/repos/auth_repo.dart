import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/entities/app_user.dart'
    show AppUser;

abstract class AuthRepo {
  Future<Either<Failure, AppUser?>> login(String email, String password);

  Future<Either<Failure, AppUser?>> signUp(
    String email,
    String password,
    String fullName,
    String phoneNumber
  );

  Future<Either<Failure, void>> requestPasswordReset(String email);

  Future<Either<Failure, void>> resetPassword(String password);

  Future<Either<Failure, void>> signOut();
}
