import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/theme.dart';
import 'features/news/presentation/bloc/news_bloc.dart';
import 'features/rate/presentation/bloc/rate_bloc.dart';
import 'home.dart';
import 'init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<RateBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<NewsBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rate Tracker',
        theme: const AppTheme().toThemeData(),
        home: const HomePage(),
      );
    });
  }
}
