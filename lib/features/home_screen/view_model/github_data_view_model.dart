import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/features/home_screen/repository/github_data_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/github_data_model.dart';

class GithubDataViewModel extends ChangeNotifier {
  String? partialUrl;
  String? githubDataForOffline;
  String? filter;
  String? lastApiCallTime;

  static GithubDataViewModel read(BuildContext context) =>
      context.read<GithubDataViewModel>();
  static GithubDataViewModel watch(BuildContext context) =>
      context.watch<GithubDataViewModel>();

  bool? _isLoading = false;
  GithubDataModel? _dataModel;
  List<ProjectItem>? _projectItems = [];
  set isLoading(bool? v) {
    _isLoading = v;
    notifyListeners();
  }

  bool? get isLoading => _isLoading;

  set projectItems(List<ProjectItem>? v) {
    _projectItems = v;
    notifyListeners();
  }

  List<ProjectItem>? get projectItems => _projectItems;

  set dataModel(GithubDataModel? v) {
    _dataModel = v;
    notifyListeners();
  }

  GithubDataModel? get dataModel => _dataModel;

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

  Future<String?> getApiCallingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lastApiCallTime =
        prefs.getString('lastApiCallTime') ?? DateTime.now().toString();
    debugPrint("lastApiCallTimeFromGet: $lastApiCallTime");
    this.lastApiCallTime = lastApiCallTime;
    notifyListeners();
    return lastApiCallTime;
  }

  setApiCallingTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // debugPrint('lastApiCallTimeSet ${DateTime.now().toString()}');
    prefs.setString("lastApiCallTime", DateTime.now().toString());
    lastApiCallTime = DateTime.now().toString();
    notifyListeners();
  }

  Future<String?> getOfflineData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var githubDataForOffline = prefs.getString('githubDataForOffline') ?? "";
    // debugPrint("githubDataForOfflineFromGet: $githubDataForOffline",
    //   wrapWidth: 1024);
    this.githubDataForOffline = githubDataForOffline;
    notifyListeners();
    return githubDataForOffline;
  }

  setOfflineData(String githubDataForOffline) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('githubDataForOfflineSet $githubDataForOffline');
    prefs.setString("githubDataForOffline", githubDataForOffline);
    this.githubDataForOffline = githubDataForOffline;
    notifyListeners();
  }

  Future<String?> getFilter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var filter = prefs.getString('filter') ?? "Best Match";
    debugPrint("filterFromGet: $filter");
    this.filter = filter;
    notifyListeners();
    return filter;
  }

  setFilter(String filter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('filterSet $filter');
    prefs.setString("filter", filter);
    this.filter = filter;
    notifyListeners();
  }

  Future<void> getRepositories() async {
    _isLoading = true;
    var res = await GithubDataRepository().fetchRepositories();
    res.fold((l) {
      _isLoading = false;
      notifyListeners();
    }, (r) {
      _isLoading = false;
      _dataModel = r;
      _projectItems = r.projectItems;
      notifyListeners();
    });
  }
}
