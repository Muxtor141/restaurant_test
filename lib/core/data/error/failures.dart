

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  final String code;
  final int sec;

  ServerFailure({this.message = '', this.code = '', this.sec = 0});
}

class CacheFailure extends Failure {}

class ContactsAccessFailure extends Failure {}
