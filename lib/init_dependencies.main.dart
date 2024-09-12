part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initRate();

  // final supabase = await Supabase.initialize(
  //   url: AppSecrets.supabaseUrl,
  //   anonKey: AppSecrets.supabaseAnonKey,
  // );

  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  // serviceLocator.registerLazySingleton(() => supabase.client);

  // serviceLocator.registerLazySingleton(
  //   () => Hive.box(name: 'rate'),
  // );

  serviceLocator.registerFactory(() => InternetConnection());

  // // core
  // serviceLocator.registerLazySingleton(
  //   () => AppUserCubit(),
  // );
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
      () => GetRateCodes(
        serviceLocator(),
      ),
    )
    ..registerFactory(
          () => SearchRateCodes(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => RateBloc(
        getRateCodes: serviceLocator(),
        searchRateCodes: serviceLocator()
      ),
    );
}
