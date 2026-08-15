import 'package:bookia_app/features/register/data/repo/model/register_request_body.dart';
import 'package:bookia_app/features/register/data/repo/register_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  register(RegisterRequestBody body) async {
    emit(RegisterLoading());

    final Response = await RegisterRepo.register(body);

    if (Response) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterError());
    }
  }
}
