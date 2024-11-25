part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class ChangeHomeSectionState extends SearchState {}

final class FilterLoadingState extends SearchState {}
final class FilterSuccessState extends SearchState {}
final class FilterFailureState extends SearchState {}
