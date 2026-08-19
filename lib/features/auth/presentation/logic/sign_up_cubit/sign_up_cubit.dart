import 'package:e_commerce/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  Future<void> signUp(String email, String password, String fullName , String phoneNumber) async {
    emit(SignUpLoading());
    final result = await _signUpUseCase(email, password, fullName , phoneNumber);
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (user) => emit(SignUpSuccess()),
    );
  }
}
