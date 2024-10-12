import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RateConvertButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool isClicked;
  final String text;

  const RateConvertButtonWidget({
    super.key,
    this.onTap,
    this.isClicked = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isClicked
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
            vertical: 1.h,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
