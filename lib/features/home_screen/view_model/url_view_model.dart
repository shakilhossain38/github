import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GithubDataViewModel extends ChangeNotifier {
  String? partialUrl;
  static GithubDataViewModel read(BuildContext context) =>
      context.read<GithubDataViewModel>();
  static GithubDataViewModel watch(BuildContext context) =>
      context.watch<GithubDataViewModel>();
  Future<String?> getPartialUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var partialUrl = prefs.getString('partialUrl') ?? "";
    debugPrint("partialUrlFromGet: $partialUrl");
    this.partialUrl = partialUrl;
    notifyListeners();
    return partialUrl;
  }

  setPartialUrl(String partialUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('partialUrlSet $partialUrl');
    prefs.setString("partialUrl", partialUrl);
    this.partialUrl = partialUrl;
    notifyListeners();
  }
}
