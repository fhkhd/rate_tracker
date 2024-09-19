import '../../../../core/secret/keys.dart';

abstract interface class RateLocalDataSource {
  Future<String> getApiKey();
}

class RateLocalDataSourceImpl implements RateLocalDataSource {
  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.rateApiKey;
  }
}
