import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/features/home_screen/repository/github_data_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/github_data_model.dart';

class GithubDataViewModel extends ChangeNotifier {
  String? partialUrl;
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
