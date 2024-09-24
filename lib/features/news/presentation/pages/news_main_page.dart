import 'package:flutter/material.dart';
import 'package:rate_tracker/features/news/presentation/widgets/news_key_word_widget.dart';
import 'package:rate_tracker/features/rate/presentation/widgets/news_item_widget.dart';
import 'package:sizer/sizer.dart';

class NewsMainPage extends StatefulWidget {
  const NewsMainPage({super.key});

  @override
  State<NewsMainPage> createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  List<String> newsKeyWord = [
    'Latest News',
    "pair-rate",
    'currency',
    "trade",
    "business",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  },
                  isSelected: index == 0 ? true : false,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) => const NewsItemWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
