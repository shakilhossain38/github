import 'package:flutter/material.dart';

import '../../model/github_data_model.dart';

class CommonListTile extends StatefulWidget {
  ProjectItem? projectItem;
  CommonListTile({Key? key, this.projectItem}) : super(key: key);

  @override
  State<CommonListTile> createState() => _CommonListTileState();
}

class _CommonListTileState extends State<CommonListTile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = const SizedBox(
      height: 5,
    );
    var data = widget.projectItem;
    String getDuration() {
      String result = data!.pushedAt
          .toString()
          .substring(0, data.pushedAt.toString().indexOf('.'));
      int? totalSecond = DateTime.now()
          .difference(
              DateTime.parse(result).toLocal().add(const Duration(hours: 6)))
          .inSeconds;
      int day = totalSecond ~/ (24 * 3600);

      totalSecond = totalSecond % (24 * 3600);
      int hour = totalSecond ~/ 3600;

      totalSecond %= 3600;
      int minutes = totalSecond ~/ 60;

      totalSecond %= 60;
      int second = totalSecond;

      return day > 0
          ? "$day${day < 10 ? "d" : "d"}"
          : hour > 0
              ? "${hour < 10 ? "0$hour" : hour}${hour > 1 ? "h" : "h"} ${minutes == 0 ? "" : "${minutes < 10 ? "0$minutes" : minutes}${minutes > 1 ? "m" : "m"}"}"
              : minutes > 0
                  ? "${minutes < 10 ? "0$minutes" : minutes}${minutes > 1 ? "m" : "m"} ${second == 0 ? "" : "${second < 10 ? "0$second" : second}${second > 1 ? "s" : "s"}"}"
                  : "${second < 10 ? "0$second" : second}${second > 1 ? "s" : "s"}";
    }

    var fullNameWidget = Text(
      "${data!.fullName}",
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
    var descriptionWidget = data.description == null
        ? const SizedBox()
        : Text(
            data.description ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                //fontWeight: FontWeight.w600,
                fontSize: 14),
          );
    var starCountWidget = SizedBox(
      //width: width * .19,
      child: Row(
        children: [
          const Icon(Icons.star_border),
          const SizedBox(
            width: 2,
          ),
          Text("${data.stargazersCount?.toStringAsFixed(2)}k"),
        ],
      ),
    );
    var forkCountWidget = SizedBox(
      //width: width * .19,
      child: Row(
        children: [
          const Icon(Icons.fork_left_outlined),
          const SizedBox(
            width: 2,
          ),
          Text("${data.forksCount?.toStringAsFixed(2)}k"),
        ],
      ),
    );
    var watcherWidget = SizedBox(
      //width: width * .19,
      child: Row(
        children: [
          const Icon(Icons.remove_red_eye),
          const SizedBox(
            width: 2,
          ),
          Text("${data.watchers?.toStringAsFixed(2)}k"),
        ],
      ),
    );
    var languageWidget = SizedBox(
      // width: width * .25,
      child: Row(
        children: [
          data.language == null || data.language == ""
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: data.language == "Dart"
                            ? Colors.teal
                            : data.language == "Python"
                                ? Colors.blue
                                : data.language == "C"
                                    ? Colors.grey
                                    : data.language == "C#"
                                        ? Colors.green
                                        : data.language == "JavaScript"
                                            ? Colors.yellowAccent
                                            : data.language == "Java"
                                                ? Colors.yellowAccent.shade100
                                                : data.language == "PHP"
                                                    ? Colors.purple
                                                    : Colors.red),
                  ),
                ),
          const SizedBox(
            width: 5,
          ),
          Text(data.language ?? ""),
        ],
      ),
    );
    var durationWidget = SizedBox(
        //width: width * .4,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(data.pushedAt == null ? "" : "Updated ${getDuration()} ago"),
      ],
    ));
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: const BoxConstraints(
        minHeight: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fullNameWidget,
            spaceBetween,
            descriptionWidget,
            spaceBetween,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    starCountWidget,
                    forkCountWidget,
                  ],
                ),
                spaceBetween,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [languageWidget, durationWidget],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
