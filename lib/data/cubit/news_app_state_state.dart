part of 'news_app_state_cubit.dart';

@immutable
abstract class NewsAppStateState {}

class NewsAppStateInitial extends NewsAppStateState {}

class NewsAppResponseLoading extends NewsAppStateState {}

class NewsAppResponseSuccess extends NewsAppStateState {

  final AllNewsModel ourData;
  NewsAppResponseSuccess({required this.ourData});
}

class NewsAppResponseField extends NewsAppStateState {}
