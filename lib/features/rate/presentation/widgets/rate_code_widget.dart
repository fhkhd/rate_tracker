import 'package:flutter/material.dart';
import 'package:rate_tracker/features/rate/domain/entities/rate_codes.dart';
import 'package:sizer/sizer.dart';
import 'package:html/dom.dart' as htmlParser;

class RateCodeWidget extends StatelessWidget {
  final RateCode rateCode;
  final void Function()? onTap;
  final bool isIntoList;

  const RateCodeWidget({
    super.key,
    required this.rateCode,
    this.onTap,
    this.isIntoList = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.w,
      width: 35.w,
      child: InkWell(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.all(1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: !isIntoList
                ? BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : BorderSide.none,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (rateCode.symbol != '')
                (rateCode.symbol != null && rateCode.symbol != "null")
                    ? Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: Center(
                          child: Text(
                            htmlParser.DocumentFragment.html(
                                        rateCode.symbol ?? '')
                                    .text ??
                                '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                          ),
                        ),
                      )
                    : Container(
                        width: 10.w,
                        height: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: Theme.of(context).colorScheme.tertiary,
                            size: 2.h,
                          ),
                        ),
                      ),
              Text(
                rateCode.code,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (!isIntoList)
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
