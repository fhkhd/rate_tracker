import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secret {
  final String rateApiKey;
  final String newsApiKey;

  Secret({this.rateApiKey = "", this.newsApiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
      rateApiKey: jsonMap["rate_api_key"],
      newsApiKey: jsonMap["news_api_key"],
    );
  }
}

class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(
      secretPath,
      (jsonStr) async {
        final secret = Secret.fromJson(json.decode(jsonStr));
        return secret;
      },
    );
  }
}
