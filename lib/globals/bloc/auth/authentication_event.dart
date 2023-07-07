part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStatusChange extends AuthenticationEvent {
  final AuthenticationStatus status;

  AuthenticationStatusChange({required this.status});
}
class AuthUserChanged extends AuthenticationEvent {
final UserEntity user;

AuthUserChanged({required this.user});
}

class AuthenticationLogOut extends AuthenticationEvent {
  final Function onSuccess;
  final Function(String message) onError;

  AuthenticationLogOut({
    required this.onError,
    required this.onSuccess,
  });
}

class CheckUserEvent extends AuthenticationEvent {}

class LogOutUser extends AuthenticationEvent {}

class RefreshTokenEvent extends AuthenticationEvent {}
