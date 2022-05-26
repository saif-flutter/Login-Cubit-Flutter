part of 'login_api_cubit.dart';

@immutable
abstract class LoginApiState {}

class LoginApiInitial extends LoginApiState {}

class LoginApiLoadingState extends LoginApiState {}
class LoginApiLoaded extends LoginApiState {

  LoginApiLoaded();
}

class LoginApiErrorState extends LoginApiState {

  String error;

  LoginApiErrorState({required this.error});
}