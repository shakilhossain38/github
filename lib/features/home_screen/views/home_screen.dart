import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repositories_list/features/home_screen/model/github_data_model.dart';
import 'package:github_repositories_list/features/home_screen/views/widgets/common_list_tile_card.dart';
import 'package:github_repositories_list/main_app/resource/string_resources.dart';
import 'package:github_repositories_list/main_app/utils/api_client.dart';

import '../../../main_app/flavour/flavour_banner.dart';
import '../../../main_app/flavour/flavour_config.dart';
import '../view_model/github_data_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  @override
  void initState() {
    var vm = GithubDataViewModel.read(context);

    Future.delayed(Duration.zero, () async {
      await vm.getPartialUrl();
      await vm.getApiCallingTime();
      await vm.getFilter();
      await vm.getOfflineData();
      itemString = vm.filter;
      if (vm.lastApiCallTime == "" || vm.lastApiCallTime == null) {
        vm.getRepositories();
      } else {
        if (DateTime.now().isBefore(DateTime.parse(vm.lastApiCallTime!)
            .add(const Duration(minutes: 30)))) {
          GithubDataModel data =
              githubDataModelFromJson(vm.githubDataForOffline!);
          vm.dataModel = data;
          vm.projectItems = data.projectItems;
        } else {
          vm.getRepositories();
        }
      }
    });

    timer = Timer.periodic(const Duration(minutes: 30), (Timer t) async {
      await vm.getRepositories();
    });

    super.initState();
  }

  Timer? timer;
  String? itemString = "Best Match";
  @override
  Widget build(BuildContext context) {
    var vm = GithubDataViewModel.watch(context);
    List<PopupMenuItem> dropdownList = [
      PopupMenuItem(
          value: StringResources.bestMatchText,
          child: Text(
            StringResources.bestMatchText,
          )),
      PopupMenuItem(
        value: StringResources.mostStarsText,
        child: Text(StringResources.mostStarsText),
      ),
      PopupMenuItem(
          value: StringResources.fewestStarsText,
          child: Text(StringResources.fewestStarsText)),
      PopupMenuItem(
          value: StringResources.mostForksText,
          child: Text(StringResources.mostForksText)),
      PopupMenuItem(
          value: StringResources.fewestForksText,
          child: Text(StringResources.fewestForksText)),
      PopupMenuItem(
        value: StringResources.recentlyUpdatedText,
        child: Text(StringResources.recentlyUpdatedText),
      ),
      PopupMenuItem(
          value: StringResources.leastRecentlyUpdatedText,
          child: Text(StringResources.leastRecentlyUpdatedText)),
    ];
    return FlavourBanner(
      bannerConfig: BannerConfig(
          bannerName: FlavorConfig.isProduction() ? "" : "DEV",
          bannerColor:
              FlavorConfig.isProduction() ? Colors.transparent : Colors.red),
      child: Scaffold(
          appBar: AppBar(
            title: Text(StringResources.githubText),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: PopupMenuButton(
                    child: Row(
                      children: [
                        const Icon(Icons.keyboard_arrow_down_rounded),
                        Text(itemString ?? ""),
                      ],
                    ),
                    itemBuilder: (context) {
                      return dropdownList;
                    },
                    onSelected: (value) async {
                      itemString = value.toString();
                      vm.setFilter(itemString!);
                      if (itemString == StringResources.bestMatchText) {
                        vm.setPartialUrl("");
                      } else if (itemString == StringResources.mostStarsText) {
                        vm.setPartialUrl("&sort=stars&order=desc");
                      } else if (itemString ==
                          StringResources.fewestStarsText) {
                        vm.setPartialUrl("&sort=stars&order=asc");
                      } else if (itemString == StringResources.mostForksText) {
                        vm.setPartialUrl("&sort=forks&order=desc");
                      } else if (itemString ==
                          StringResources.fewestForksText) {
                        vm.setPartialUrl("&sort=forks&order=asc");
                      } else if (itemString ==
                          StringResources.recentlyUpdatedText) {
                        vm.setPartialUrl("&sort=updated&order=desc");
                      } else if (itemString ==
                          StringResources.leastRecentlyUpdatedText) {
                        vm.setPartialUrl("&sort=updated&order=asc");
                      }
                      await vm.getPartialUrl();
                      vm.getRepositories();

                      vm.getFilter();
                    }),
              ),
            ],
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
                )),
    );
  }
}
