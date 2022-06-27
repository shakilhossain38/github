import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/main_app/utils/api_client.dart';

import '../view_model/url_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var vm = GithubDataViewModel.read(context);

    Future.delayed(Duration.zero, () async {
      await vm.getPartialUrl();
      var response = await ApiClient()
          .getRequest("&per_page=10&page=1&sort=updated&order=desc");
      print("api_call ${response.body}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github"),
      ),
    );
  }
}
