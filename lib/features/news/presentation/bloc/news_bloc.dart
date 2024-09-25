import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_event.dart';

part 'news_state.dart';
class NewsBloc extends Bloc<NewsEvent, NewsState>{
  NewsBloc(super.initialState);
}