import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
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
          ],
        ),
      ),
    );
  }
}
