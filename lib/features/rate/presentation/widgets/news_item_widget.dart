import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_tracker/features/news/domain/entities/article.dart';
import 'package:sizer/sizer.dart';

class NewsItemWidget extends StatelessWidget {
  final Article article;

  const NewsItemWidget({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: 35.w,
              width: 35.w,
              padding: EdgeInsets.all(1.w),
              child: Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Icon(
                  Icons.image_outlined,
                  size: 20.w,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 29.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      article.name,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Text(
                      dateConverter(article.publishedAt),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // will be in use case
  String dateConverter(String serverDate) {
    DateTime dateTime = DateTime.parse(serverDate);

    DateFormat formatter = DateFormat('yyyy/MM/dd HH:mm:ss');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
