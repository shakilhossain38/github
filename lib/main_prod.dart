import 'package:flutter/material.dart';
import 'package:github_repositories_list/root.dart';

import 'main_app/flavour/flavour_config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    color: Colors.deepPurpleAccent,
  );
  runApp(const Root());
}
