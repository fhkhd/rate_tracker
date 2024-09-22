import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NewsKeyWordWidget extends StatelessWidget {
  final void Function()? onTap;
  final String keyWord;
  final bool isSelected;

  const NewsKeyWordWidget({
    super.key,
    this.onTap,
    required this.keyWord,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isSelected
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.secondaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Center(
            child: Text(
              keyWord,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
