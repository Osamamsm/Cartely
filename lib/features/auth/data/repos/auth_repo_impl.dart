import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/exception_mapper.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/domain/entities/app_user.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, AppUser?>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      final user = response.user;
      return Right(AppUser(id: user!.id, email: user.email!));
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, AppUser?>> signUp(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    try {
      final response = await _remoteDataSource.signUp(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber
      );
      final user = response.user;
      return Right(AppUser(id: user!.id, email: user.email!));
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> requestPasswordReset(String email) async {
    try {
      await _remoteDataSource.requestPasswordReset(email: email);
      return Right(null);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String password) async {
    try {
      await _remoteDataSource.resetPassword(password: password);
      return Right(null);
    } catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      return Right(null);
    } on Exception catch (e) {
      return Left(ExceptionMapper.mapExceptionToFailure(e));
    }
  }
}
