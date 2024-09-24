import '../../../../core/secret/keys.dart';

abstract interface class NewsLocalDataSource {
  Future<String> getApiKey();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<String> getApiKey() async {
    SecretLoader secretLoader =
        SecretLoader(secretPath: 'assets/secret/secret.json');
    Secret secret = await secretLoader.load();
    return secret.newsApiKey;
  }
}
