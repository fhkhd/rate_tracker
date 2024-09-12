import 'package:flutter/cupertino.dart';
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
    return Container(
      height: 35.w,
      width: 35.w,
      child: InkWell(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                child: Center(
                  child: Text(
                    htmlParser.DocumentFragment.html("&#36;").text ?? "",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
              ),
              Text(
                rateCode.code,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                rateCode.fullName,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
