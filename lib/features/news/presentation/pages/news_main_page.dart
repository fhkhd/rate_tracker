import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_tracker/features/news/presentation/widgets/news_key_word_widget.dart';
import 'package:rate_tracker/features/rate/presentation/widgets/news_item_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/show_snackbar.dart';
import '../bloc/news_bloc.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({super.key});

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  List<String> newsKeyWord = [
    "pair-rate",
    'business',
    'currency',
    "trade",
    "bitcoin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NewsBloc, NewsState>(
        listener: (BuildContext context, NewsState state) {
          if (state is NewsFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (BuildContext context, NewsState state) {
          return Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsKeyWord.length,
                    itemBuilder: (context, index) => NewsKeyWordWidget(
                      keyWord: newsKeyWord[index],
                      onTap: () async {
                        // read event
                        context.read<NewsBloc>().add(
                              NewsSelectChip(
                                query: newsKeyWord[index],
                              ),
                            );
                      },
                      isSelected: index == 0 ? true : false,
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: state is ArticleDisplaySuccess
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.articles.length,
                          itemBuilder: (context, index) => NewsItemWidget(
                            article: state.articles[index],
                          ),
                        )
                      : const Center(
                          child: Text("no news"),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
