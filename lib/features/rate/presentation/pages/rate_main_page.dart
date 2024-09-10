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
                itemBuilder: (context, index) => RateCodeWidget(
                  rateCode: state.rateCodes.supportedCodes![index],
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
