part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initRate();
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

    // Repository
    ..registerFactory<RateRepository>(
      () => RateRepositoryImpl(
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
