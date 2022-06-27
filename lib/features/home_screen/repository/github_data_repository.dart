import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_repositories_list/features/home_screen/view_model/github_data_view_model.dart';
import 'package:provider/provider.dart';

import '../../../main_app/app_navigator.dart';
import '../../../main_app/failure/app_error.dart';
import '../../../main_app/utils/api_client.dart';
import '../model/github_data_model.dart';

class GithubDataRepository {
  Future<Either<AppError, GithubDataModel>> fetchRepositories() async {
    var response = await ApiClient().getRequest(
        GithubDataViewModel.read(appNavigator.context!).partialUrl.toString());
    try {
      if (response.statusCode == 200) {
        var vm = GithubDataViewModel.read(appNavigator.context!);
        debugPrint("repositories list${response.body}");

        vm.setOfflineData(utf8.decode(response.bodyBytes));
        await vm.setApiCallingTime();
        await vm.getApiCallingTime();
        GithubDataModel data =
            githubDataModelFromJson(utf8.decode(response.bodyBytes));
        return Right(data);
      } else {
        // BotToast.showText(text: 'Fail Data');
        return const Left(AppError.httpError);
      }
    } catch (c) {
      return const Left(AppError.serverError);
    }
  }
}
