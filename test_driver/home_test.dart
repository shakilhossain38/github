import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:github_repositories_list/main_app/resource/keys.dart';
import 'package:github_repositories_list/main_app/resource/string_resources.dart';

main() {
  homeTest();
}

Future<void> homeTest() async {
  group('home test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    //test cases are started from here
    test('When__try_to_start_page__should__get_github_text_on_appbar',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        expect(await driver!.getText(Keys.homeAppbarKey),
            StringResources.githubText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test('when__try_to_get_most_star_projects__should__get_most_stars_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.mostStarsText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(
            await driver!.getText(Keys.sortKey), StringResources.mostStarsText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test('when__try_to_get_fewest_star_projects__should__get_fewest_stars_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.fewestStarsText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(await driver!.getText(Keys.sortKey),
            StringResources.fewestStarsText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test('when__try_to_get_most_forks_projects__should__get_most_forks_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.mostForksText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(
            await driver!.getText(Keys.sortKey), StringResources.mostForksText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test(
        'when__try_to_get_fewest_forks_projects__should__get_fewest_forks_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.fewestForksText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(await driver!.getText(Keys.sortKey),
            StringResources.fewestForksText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test(
        'when__try_to_most_recently_updated_projects__should__get_most_recently_updated_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.recentlyUpdatedText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(await driver!.getText(Keys.sortKey),
            StringResources.recentlyUpdatedText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });
    test(
        'when__try_to_least_recently_updated_projects__should__get_least_recently_updated_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.leastRecentlyUpdatedText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(await driver!.getText(Keys.sortKey),
            StringResources.leastRecentlyUpdatedText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test('when__try_to_best_match_projects__should__get_best_match_text',
        () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(Keys.homePopupMeuKey);
        await Future.delayed(const Duration(seconds: 1), () {});
        await driver!.tap(find.text(StringResources.bestMatchText));
        await Future.delayed(const Duration(seconds: 1), () {});
        expect(
            await driver!.getText(Keys.sortKey), StringResources.bestMatchText);
        await Future.delayed(const Duration(seconds: 1), () {});
      });
    });

    test('When__try_to_scroll__should__scroll', () async {
      await driver!.runUnsynchronized(() async {
        await Future.delayed(const Duration(seconds: 2), () {});
        await driver!.scrollUntilVisible(Keys.projectCard0, Keys.projectCard7,
            dyScroll: -100);
        await Future.delayed(const Duration(seconds: 2), () {});
      });
    });
  });
}
