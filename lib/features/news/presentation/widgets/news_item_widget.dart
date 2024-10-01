import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rate_tracker/features/news/domain/entities/article.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemWidget extends StatelessWidget {
  final Article article;
  final void Function()? onTap;
  final bool isSelected;

  const NewsItemWidget({
    super.key,
    required this.article,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          key: ValueKey<String>(article.id),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: Tween<double>(begin: isSelected ? 0.8 : 1.0, end: 1.0)
                  .animate(animation),
              child: child,
            );
          },
          child: isSelected
              ? Card(
                  key: ValueKey<String>(article.id),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: article.urlToImage != 'null'
                            ? ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Icon(
                                Icons.image_outlined,
                                size: 50.w,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Column(
                          children: [
                            Text(
                              article.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  article.name,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.link,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                  onPressed: () async {
                                    try {
                                      var url = Uri.parse(article.url == 'null'
                                          ? 'https://www.google.com/'
                                          : article.url);
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Unable to launch ${url.query}')),
                                        );
                                      }
                                    } catch (e) {
                                      print('Error launching URL: $e');
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text(
                              dateConverter(article.publishedAt),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Card(
                  key: ValueKey<String>("${article.id}_unselected"),
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
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          child: article.urlToImage != 'null'
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    article.urlToImage,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : Icon(
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
                )),
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
