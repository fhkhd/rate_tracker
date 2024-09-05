import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return const CircularProgressIndicator();
          }
          if (state is RateDisplaySuccess) {
            return GridView.builder(
              itemCount: 40,
              itemBuilder: (context, index) => const Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("USD"),
                    Text("United States Dollar"),
                  ],
                ),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
            );
            //   ListView.builder(
            //   itemCount: state.blogs.length,
            //   itemBuilder: (context, index) {
            //     final blog = state.blogs[index];
            //     return BlogCard(
            //       blog: blog,
            //       color: index % 2 == 0
            //           ? AppPallete.gradient1
            //           : AppPallete.gradient2,
            //     );
            //   },
            // );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
