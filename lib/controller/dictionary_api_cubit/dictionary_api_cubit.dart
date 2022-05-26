import 'package:api/controller/dictionary_api_cubit/dictionary_api_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/dictionary_model.dart';

part 'dictionary_api_state.dart';

class DictionaryApiCubit extends Cubit<DictionaryApiState> {
  DictionaryApiCubit() : super(DictionaryApiInitial());

  void dictionaryApi({ required String name})
  async {
    /// initial State
    emit(DictionaryApiLoading());

    final dicData= await DictionaryApiRepo.dictionaryApi(name) ;

    print(dicData.runtimeType);
    print('===================');
    print(dicData);
    if(dicData != null) {
      /// Loaded State

        emit(DictionaryApiLoadedState(dictionaryModel: dicData));

    } else {

      /// error state
      emit(DictionaryApiErrorState(error: ''));
    }

  }

  }



