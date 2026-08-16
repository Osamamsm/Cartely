import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/entities/app_user.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);

  Future<Either<Failure, AppUser?>> call(
    String email,
    String password,
    String fullName,
    String phoneNumber
  ) async {
    return _authRepo.signUp(email, password, fullName , phoneNumber);
  }
}
