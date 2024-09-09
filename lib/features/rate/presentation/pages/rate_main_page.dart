import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_tracker/core/utils/show_snackbar.dart';
import 'package:sizer/sizer.dart';
import 'package:html/dom.dart' as htmlParser;

import '../bloc/rate_bloc.dart';

class RateMainPage extends StatefulWidget {
  const RateMainPage({super.key});

  @override
  State<RateMainPage> createState() => _RateMainPageState();
}

class _RateMainPageState extends State<RateMainPage> {
  @override
  void initState() {
    super.initState();
    context.read<RateBloc>().add(RateFetchAllRateCodes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RateBloc, RateState>(
        listener: (context, state) {
          if (state is RateFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is RateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RateDisplaySuccess) {
            return Padding(
              padding: EdgeInsets.all(2.w),
              child: GridView.builder(
                itemCount: state.rateCodes.supportedCodes?.length,
                itemBuilder: (context, index) => Card(
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
                        state.rateCodes.supportedCodes![index].code,
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
                        state.rateCodes.supportedCodes![index].fullName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
