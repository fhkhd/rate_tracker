import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<RateBloc>().add(RateFetchAllRateCodes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RateBloc, RateState>(
        listener: (context, state) {
          if (state is RateFailure) {
            // return Text("${state.error}");
            print("RateFailure is : ${state.error}");
            // showSnackBar(context, state.error);
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
              padding: EdgeInsets.all(1.w),
              child: GridView.builder(
                itemCount: state.rate.supportedCodes?.length,
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.all(0.5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.rate.supportedCodes![index].code,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        state.rate.supportedCodes![index].fullName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
