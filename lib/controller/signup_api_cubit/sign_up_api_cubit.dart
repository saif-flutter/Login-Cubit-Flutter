import 'package:api/controller/signup_api_cubit/signup_repo_api.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../model/login_model.dart';

part 'sign_up_api_state.dart';

class SignUpApiCubit extends Cubit<SignUpApiState> {
  SignUpApiCubit() : super(SignUpApiInitial());

   Future<void> signApi({required BuildContext context, required String name,required String email,required String password})

   async {


    ///initial State
    emit(SignUpApiInitial());

    final userdata= await  SignUpRepoAPi.signApi(context,name, email, password);

    debugPrint(userdata);

    if(userdata!=null)
{
  /// Loaded State
  Future.delayed(const Duration(seconds: 2));
  emit(SignUpApiLoaded(userModel: userdata));
}
    else
      {
        /// Error State
        emit(SignUpApiError(error: 'Error State'));
      }

  }
}
