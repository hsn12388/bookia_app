import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(RegisterLoading());

    if (password != passwordConfirmation) {
      emit(RegisterPasswordMismatch());
      return;
    }

    try {
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError());
    }
  }
}
