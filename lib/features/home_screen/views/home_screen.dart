import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/features/home_screen/views/widgets/common_list_tile_card.dart';
import 'package:github_repositories_list/main_app/utils/api_client.dart';

import '../view_model/github_data_view_model.dart';

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
      vm.getRepositories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = GithubDataViewModel.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Github"),
      ),
      body: vm.isLoading!
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                  itemCount: vm.projectItems?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CommonListTile(
                      projectItem: vm.projectItems![index],
                    );
                  }),
            ),
    );
  }
}
