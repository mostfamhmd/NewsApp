import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/data/request.dart';

import '../all_news_app.dart';

part 'news_app_state_state.dart';

class NewsAppStateCubit extends Cubit<NewsAppStateState> {
  NewsAppStateCubit() : super(NewsAppStateInitial());
  getNews(){
    emit(NewsAppResponseLoading());

    AllNewsRepo().getResponse().then((value){
      if(value != null){
        emit(NewsAppResponseSuccess(ourData: value));
      } else {
        emit(NewsAppResponseField());
      }
    });
  }
}
