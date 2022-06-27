import '../flavour/flavour_config.dart';

class Urls {
  static String get baseUrl => FlavorConfig.isProduction()
      ? "https://api.github.com/search/repositories?q=flutter&per_page=50&page=1"
      : "https://api.github.com/search/repositories?q=flutter&per_page=50&page=1";
}
