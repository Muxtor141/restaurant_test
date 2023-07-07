part of 'authentication_bloc.dart';

@immutable
class AuthenticationState {
  final AuthenticationStatus status;
  final UserEntity user;

  const AuthenticationState._({required this.status, required this.user});

  const AuthenticationState.authenticated(UserEntity user)
      : this._(status: AuthenticationStatus.authenticated, user: user);


  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, user: UserModel.fromJson(const {}));
  AuthenticationState.unknown()
      : this._(status: AuthenticationStatus.unknown, user: UserModel.fromJson(const {}));
}
