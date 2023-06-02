part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class MySetState extends SearchState {}

//search
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {}
class SearchErrorState extends SearchState {}
//search by image
class SearchImageLoadingState extends SearchState {}

class SearchImageSuccessState extends SearchState {}

class SearchImageErrorState extends SearchState {}

//
class MySetStateImage extends SearchState {}

