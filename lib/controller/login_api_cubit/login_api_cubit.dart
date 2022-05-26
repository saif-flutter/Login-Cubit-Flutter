import 'package:api/controller/login_api_cubit/login_repo_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_api_state.dart';

class LoginApiCubit extends Cubit<LoginApiState> {
  LoginApiCubit() : super(LoginApiInitial());

  Future<void> loginApi({ required BuildContext ctxx, required String email,required String password})

  async {


    ///initial State
    emit(LoginApiInitial());

    final loginData= await  LoginRepoApi.login(ctxx, email, password);

    debugPrint(loginData);

    if(loginData!=null)
    {
      /// Loaded State
      Future.delayed(const Duration(seconds: 2));
     emit(LoginApiLoaded());
    }
    else
    {
      /// Error State
      emit(LoginApiErrorState(error: 'Error Found'));
    }

  }
}


