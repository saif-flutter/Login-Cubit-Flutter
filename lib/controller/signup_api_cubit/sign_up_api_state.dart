part of 'sign_up_api_cubit.dart';

@immutable
abstract class SignUpApiState {}

class SignUpApiInitial extends SignUpApiState {}

class SignUpApiLoaded extends SignUpApiState {

   UserModel userModel;
  SignUpApiLoaded({required this.userModel});
}

class SignUpApiError extends SignUpApiState {

  String error;
  SignUpApiError({required this.error});
}

