part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initRate();
  _initNews();
  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
}

void _initRate() {
  // Datasource
  serviceLocator
    ..registerFactory<RateRemoteDataSource>(
      () => RateRemoteDataSourceImpl(),
    )
    ..registerFactory<RateLocalDataSource>(
      () => RateLocalDataSourceImpl(),
    )
    // Repository
    ..registerFactory<RateRepository>(
      () => RateRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => SearchRateCodes(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => PairRateCodes(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => RateBloc(
        searchRateCodes: serviceLocator(),
        pairRateCodes: serviceLocator(),
      ),
    );
}

void _initNews() {
  // Datasource
  serviceLocator
    ..registerFactory<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(),
    )
    ..registerFactory<NewsLocalDataSource>(
      () => NewsLocalDataSourceImpl(),
    )
    // Repository
    ..registerFactory<NewsRepository>(
      () => NewsRepositoryImpl(
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetArticles(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => NewsBloc(
        getArticles: serviceLocator(),
      ),
    );
}
