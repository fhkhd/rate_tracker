import 'package:flutter/material.dart';
import 'package:rate_tracker/features/rate/domain/entities/rate_codes.dart';
import 'package:sizer/sizer.dart';
import 'package:html/dom.dart' as htmlParser;

class RateCodeWidget extends StatelessWidget {
  final RateCode rateCode;

  const RateCodeWidget({
    super.key,
    required this.rateCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.all(1.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              rateCode.code,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              htmlParser.DocumentFragment.html("&#36;").text ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 14.sp,
                  ),
            ),
            Text(
              rateCode.fullName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
