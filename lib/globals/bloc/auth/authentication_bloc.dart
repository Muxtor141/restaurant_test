import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:test_app/core/data/singleton/storage.dart';
import 'package:test_app/globals/entity/user.dart';
import 'package:test_app/globals/model/user_model.dart';
import 'package:test_app/modules/profile/domain/usecase/get_profile.dart';
import 'package:test_app/utils/status.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late StreamSubscription<AuthenticationStatus> statusSubscription;
  final GetProfileUseCase getUser;

  AuthenticationBloc(this.getUser)
      : super(AuthenticationState.unauthenticated()) {
    on<CheckUserEvent>((event, emit) async {
      if (StorageRepository.getString('token', defValue: '').isNotEmpty) {
        final result = await getUser('');
        if (result.isRight) {
          emit(AuthenticationState.authenticated(result.right));
        } else {
          emit(AuthenticationState.unauthenticated());
        }
      } else {
        emit(AuthenticationState.unauthenticated());
      }
    });
    on<AuthenticationStatusChange>((event, emit) async {
      switch (event.status) {
        case AuthenticationStatus.authenticated:
          final result = await getUser('');
          if (result.isRight) {
            emit(AuthenticationState.authenticated(result.right));
          } else {
            await StorageRepository.deleteString('token');
            emit(AuthenticationState.unauthenticated());
          }
          break;
        case AuthenticationStatus.unauthenticated:
          emit(AuthenticationState.unauthenticated());
          break;
        case AuthenticationStatus.unknown:
          emit(AuthenticationState.unauthenticated());
          break;
      }
    });

    on<LogOutUser>((event, emit) async {
      await StorageRepository.deleteString('token');
      add(AuthenticationStatusChange(
          status: AuthenticationStatus.unauthenticated));
    });

    on<RefreshTokenEvent>((event, emit) async {});
  }

  @override
  Future<void> close() {
    statusSubscription.cancel();
    return super.close();
  }
}
