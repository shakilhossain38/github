import 'package:flutter/material.dart';

import '../resource/string_resources.dart';

enum Flavor { DEV, QA, PRODUCTION }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
  }) {
    _instance ??= FlavorConfig._internal(
        flavor, StringResources.enumName(flavor.toString()), color);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;

  static bool isQA() => _instance!.flavor == Flavor.QA;

  static String appName() {
    if (_instance!.flavor == Flavor.QA) {
      return "Github List QA";
    } else if (_instance!.flavor == Flavor.DEV) {
      return "Github List Dev";
    } else {
      return "Github List";
    }
  }
}
