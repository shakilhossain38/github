import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/features/home_screen/views/home_screen.dart';
import 'package:provider/provider.dart';

import 'features/home_screen/view_model/url_view_model.dart';
import 'main_app/app_navigator.dart';
import 'main_app/resource/colors.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providers = [
      ChangeNotifierProvider<GithubDataViewModel>(create: (context) => GithubDataViewModel()),
    ];
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: "Github_Repos",
        themeMode: ThemeMode.light,
        theme: AppTheme.primaryTheme,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        navigatorKey: appNavigator.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
