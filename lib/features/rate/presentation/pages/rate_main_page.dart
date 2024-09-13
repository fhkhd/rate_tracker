import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_tracker/core/utils/show_snackbar.dart';
import 'package:rate_tracker/features/rate/presentation/widgets/rate_code_widget.dart';
import 'package:sizer/sizer.dart';

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
          return Padding(
            padding: EdgeInsets.all(2.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: CupertinoSearchTextField(
                    onChanged: (value) async {
                      context.read<RateBloc>().add(
                            RateSearchRateCode(
                              value: value,
                            ),
                          );
                    },
                    placeholder: "Search rate code",
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    itemColor: Theme.of(context).colorScheme.tertiary,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     RateCodeWidget(
                //       rateCode: state.rateCodes.supportedCodes![0],
                //     ),
                //     Text("pair to : "),
                //     RateCodeWidget(
                //       rateCode: state.rateCodes.supportedCodes![1],
                //     ),
                //   ],
                // ),
                Padding(
                  padding: EdgeInsets.all(1.w),
                  child: const Divider(),
                ),
                if (state is RateSearchDisplaySuccess)
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.rateCodes.supportedCodes?.length,
                      itemBuilder: (context, index) => RateCodeWidget(
                        rateCode: state.rateCodes.supportedCodes![index],
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                    ),
                  ),
                if (state is RateLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
