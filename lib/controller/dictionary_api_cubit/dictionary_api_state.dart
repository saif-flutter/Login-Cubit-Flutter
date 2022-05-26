part of 'dictionary_api_cubit.dart';

@immutable
abstract class DictionaryApiState {}

class DictionaryApiInitial extends DictionaryApiState {}
class DictionaryApiLoading extends DictionaryApiState {}

class DictionaryApiLoadedState extends DictionaryApiState {

  DictionaryModel dictionaryModel;

  DictionaryApiLoadedState({required this.dictionaryModel});
}

class DictionaryApiErrorState extends DictionaryApiState {

  String error;

  DictionaryApiErrorState({required this.error});
}
