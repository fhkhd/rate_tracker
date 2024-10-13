import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_tracker/core/utils/show_snackbar.dart';
import 'package:rate_tracker/features/rate/presentation/widgets/rate_code_widget.dart';
import 'package:rate_tracker/features/rate/presentation/widgets/rate_convert_button_widget.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/rate_codes.dart';
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
    SearchController searchController = SearchController();
    final indexController = TextEditingController();
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
                if (state is! SecondRateSearch || state is! RatePairRatesResult)
                  Padding(
                    padding: EdgeInsets.all(1.w),
                    child: CupertinoSearchTextField(
                      controller: searchController,
                      onSubmitted: (value) async {
                        if (state is FirstRateSearch) {
                          context.read<RateBloc>().add(
                                RateSearchRateCode(
                                  value: value,
                                  firstRateCode: state.firstRateCode,
                                ),
                              );
                        } else {
                          context.read<RateBloc>().add(
                                RateSearchRateCode(
                                  value: value,
                                ),
                              );
                        }
                      },
                      placeholder: "Search rate code",
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      itemColor: Theme.of(context).colorScheme.tertiary,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                if (state is! RatePairRatesResult && state is! SecondRateSearch)
                  Text(
                    state is FirstRateSearch
                        ? 'Choose the second rate'
                        : state is RateSearchDisplaySuccess
                            ? 'Select one rate'
                            : state is RateInitial
                                ? 'Choose the first rate'
                                : '',
                  ),
                if (state is FirstRateSearch)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RateCodeWidget(
                        rateCode: state.firstRateCode,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10.w,
                            child: Center(
                              child: Icon(
                                Icons.trending_flat_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          RateConvertButtonWidget(
                            text: state is RatePairRatesResult
                                ? 'Paired to'
                                : "Pair to",
                            onTap: state is SecondRateSearch &&
                                    state is! RatePairRatesResult
                                ? () {
                                    context.read<RateBloc>().add(
                                          RatePairRateCodes(
                                            firstCode: state.firstRateCode.code,
                                            secondCode:
                                                state.secondRateCode.code,
                                          ),
                                        );
                                  }
                                : null,
                            isClicked: state is SecondRateSearch &&
                                state is! RatePairRatesResult,
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<RateBloc>().add(RateRestSelection());
                            },
                            child: Text(
                              "Reset",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      state is SecondRateSearch
                          ? RateCodeWidget(
                              rateCode: state.secondRateCode,
                            )
                          : RateCodeWidget(
                              rateCode: RateCode(
                                code: "",
                                fullName: "",
                                symbol: '',
                              ),
                            ),
                    ],
                  ),
                if (state is RatePairRatesResult)
                  Column(
                    children: [
                      Card(
                        margin: EdgeInsets.only(
                          top: 5.h,
                          left: 1.w,
                          right: 1.w,
                          bottom: 2.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 5.w,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Result : ',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                              Text(
                                state.pairCodes.conversionRate,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      state is RateCalculatePairedResult
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20.w,
                                  margin: EdgeInsets.all(2.w),
                                  child: TextFormField(
                                    controller: indexController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 2,
                                        horizontal: 3,
                                      ),
                                    ),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 7.h, left: 0.5.w),
                                  child: Text(
                                    state.firstRateCode.code,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                ),
                                RateConvertButtonWidget(
                                  text: '=',
                                  isClicked: state is! RateCalculatedResult,
                                  onTap: state is! RateCalculatedResult
                                      ? () {
                                          context
                                              .read<RateBloc>()
                                              .add(RateCalculateResult(
                                                state.firstRateCode,
                                                state.secondRateCode,
                                                indexController.text,
                                                state.pairCodes,
                                              ));
                                        }
                                      : null,
                                ),
                                Container(
                                  margin: EdgeInsets.all(2.w),
                                  width: 21.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(1.w),
                                  child: Text(
                                    state is RateCalculatedResult
                                        ? state.calculateResult
                                        : '?',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 7.h, left: 0.5.w),
                                  child: Text(
                                    state.secondRateCode.code,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<RateBloc>()
                                        .add(RateShowCalculatePart(
                                          state.firstRateCode,
                                          state.secondRateCode,
                                          state.pairCodes,
                                        ));
                                  },
                                  child: Text(
                                    "clear",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                  ),
                                )
                              ],
                            )
                          : TextButton(
                              onPressed: () {
                                context
                                    .read<RateBloc>()
                                    .add(RateShowCalculatePart(
                                      state.firstRateCode,
                                      state.secondRateCode,
                                      state.pairCodes,
                                    ));
                              },
                              child: Text(
                                "Calculate?",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                              ),
                            ),
                    ],
                  ),
                if (state is RateSearchDisplaySuccess)
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.rateCodes.supportedCodes?.length,
                      itemBuilder: (context, index) => RateCodeWidget(
                        rateCode: state.rateCodes.supportedCodes![index],
                        onTap: () {
                          searchController.clear();
                          if (state.rateCode != null) {
                            context.read<RateBloc>().add(
                                  RateSelectSecondRateCode(
                                    firstRateCode: state.rateCode ??
                                        RateCode(
                                          code: "",
                                          fullName: "",
                                        ),
                                    secondRateCode:
                                        state.rateCodes.supportedCodes![index],
                                  ),
                                );
                          } else {
                            context.read<RateBloc>().add(
                                  RateSelectFirstRateCode(
                                    firstRateCode:
                                        state.rateCodes.supportedCodes![index],
                                  ),
                                );
                          }
                        },
                        isIntoList: true,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                    ),
                  ),
                if (state is RateLoading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
