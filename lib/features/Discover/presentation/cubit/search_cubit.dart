import 'package:anime_app/features/Discover/data/models/SearchActors.dart';
import 'package:anime_app/features/Discover/data/models/SearchCharacter.dart';
import 'package:anime_app/features/Discover/data/models/SearchImageData.dart';
import 'package:anime_app/features/Discover/data/models/search.dart';
import 'package:anime_app/features/Discover/data/repositories/SearchRepository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;
  SearchCubit({required this.searchRepository}) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  //object model
  SearchModel? searchModel;
  SearchActors? searchActors;
  SearchCharacter? searchCharacter;
  SearchImageData? searchImageData;

  void SearchByImage() async {
    searchImageData = null;
    emit(SearchImageLoadingState());
    //kana
    try {
      var data = await searchRepository.SearchByImage();
      searchImageData = data;

      emit(SearchImageSuccessState());
    } catch (e) {
      print(e.toString());
      emit(SearchImageErrorState());
    }
  }

  void searchForAnime({required String q}) async {
    searchModel = null;
    emit(SearchLoadingState());
    print('searchForAnime');
    try {
      final data = await searchRepository.searchForAnime(q: q);
      searchModel = data;
      emit(SearchSuccessState());
      print(searchModel!.data![0].episodes);
    } catch (e) {
      print(e);
      emit(SearchErrorState());
    }
  }

  void getSearchActors({
    required String q,
  }) async {
    searchActors = null;
    print('getSearchActors');
    emit(SearchLoadingState());

    try {
      final data = await searchRepository.searchForActors(q: q);
      searchActors = data;
      emit(SearchSuccessState());
    } catch (e) {
      print(e);
      emit(SearchErrorState());
    }
  }

  void getSearchCharacter({
    required String q,
  }) async {
    searchCharacter = null;
    print('getSearchCharacter');
    emit(SearchLoadingState());

    try {
      final data = await searchRepository.searchForCharacter(q: q);
      searchCharacter = data;
      emit(SearchSuccessState());
    } catch (e) {
      print(e);
      emit(SearchErrorState());
    }
  }

  void setEmptyData() {
    searchActors = null;
    searchModel = null;
    searchCharacter = null;
    emit(MySetState());
  }

  void mySetStateImage() {
    emit(MySetStateImage());
  }
}
