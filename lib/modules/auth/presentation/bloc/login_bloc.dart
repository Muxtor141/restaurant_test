import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/core/data/error/failures.dart';
import 'package:test_app/modules/auth/domain/usecase/login_user.dart';
import 'package:test_app/utils/action_status.dart';


part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase login;

  LoginBloc({required this.login}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      print('login Bloc');
      emit(state.copyWith(status: ActionStatus.inProcess));
      final result = await login(LoginParams(password: event.password, email: event.email));
      if (result.isRight) {
        print('succes send code');
        emit(state.copyWith(status: ActionStatus.isSuccess));
        event.onSuccess();
      } else {
        var left=result.left;
        if(left is ServerFailure){
          emit(state.copyWith(status: ActionStatus.isFailure));
          event.onError(left.message);
        }else {
          emit(state.copyWith(status: ActionStatus.isFailure));
          event.onError('Error occured');
        }

      }
    });
  }
}
