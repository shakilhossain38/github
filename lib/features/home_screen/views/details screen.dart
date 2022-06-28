import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/github_data_model.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatefulWidget {
  ProjectItem? projectItem;
  DetailsScreen({Key? key, this.projectItem}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    list?.clear();
    widget.projectItem?.topics?.forEach((element) {
      list!.add(Padding(
        padding: const EdgeInsets.only(right: 4, bottom: 4),
        child: Container(
            constraints: const BoxConstraints(minWidth: 50, minHeight: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(.7)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                element,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            )),
      ));
    });
    super.initState();
  }

  List<Widget>? list = [];

  @override
  Widget build(BuildContext context) {
    var spaceBetweenMax = const SizedBox(
      height: 10,
    );
    var spaceBetweenMin = const SizedBox(
      height: 10,
    );
    Widget commonDateWidget({String? title, String? date}) {
      return Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(DateFormat("MM-dd-yy hh:mm:ss a").format(DateTime.parse(date!))),
        ],
      );
    }

    Widget commonCountWidget({String? title, double? count}) {
      return Row(
        children: [
          Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 5,
          ),
          Text("${count?.toInt().toString()}"),
        ],
      );
    }

    Widget commonTitleLanguageWidget({String? title, String? text}) {
      return Row(
        children: [
          Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text!),
        ],
      );
    }

    String? updateTime = widget.projectItem?.updatedAt.toString();
    String? createTime = widget.projectItem?.createdAt.toString();
    String? pushTime = widget.projectItem?.pushedAt.toString();
    var profileWidget = Container(
      constraints: const BoxConstraints(minHeight: 100),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        color: Colors.blueGrey,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(50)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: widget.projectItem?.owner?.avatarUrl ?? "",
                  height: 30,
                  width: 30,
                ),
              ),
            ),
            spaceBetweenMax,
            Text(
              widget.projectItem?.owner?.login ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
    var repositoryNameWidget = commonTitleLanguageWidget(
        title: "Repository name:", text: widget.projectItem?.fullName ?? "");
    var languageWidget = commonTitleLanguageWidget(
        title: "Language:", text: widget.projectItem?.language ?? "");

    var visibilityWidget = commonTitleLanguageWidget(
        title: "Visibility:", text: widget.projectItem?.visibility ?? "");
    var descriptionWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description:",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        spaceBetweenMin,
        Text(widget.projectItem?.description ?? ""),
      ],
    );
    var createdAtWidget = widget.projectItem?.createdAt == null
        ? const SizedBox()
        : commonDateWidget(title: "Created:", date: createTime.toString());
    var updatedAtWidget = widget.projectItem?.updatedAt == null
        ? const SizedBox()
        : commonDateWidget(title: "Updated:", date: updateTime.toString());
    var pushedAtWidget = widget.projectItem?.pushedAt == null
        ? const SizedBox()
        : commonDateWidget(title: "Pushed:", date: pushTime.toString());
    var topicsWidget = widget.projectItem?.topics?.length == 0
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Topics:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              spaceBetweenMin,
              Wrap(
                children: list!,
              ),
            ],
          );
    var starsWidget = widget.projectItem?.forksCount == null
        ? const SizedBox()
        : commonCountWidget(
            title: "Stars",
            count: (widget.projectItem?.stargazersCount ?? 0) * 1000);
    var forksWidget = widget.projectItem?.stargazersCount == null
        ? const SizedBox()
        : commonCountWidget(
            title: "Forks",
            count: (widget.projectItem?.forksCount ?? 0) * 1000);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileWidget,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spaceBetweenMax,
                  repositoryNameWidget,
                  spaceBetweenMax,
                  languageWidget,
                  spaceBetweenMax,
                  topicsWidget,
                  spaceBetweenMax,
                  descriptionWidget,
                  spaceBetweenMax,
                  createdAtWidget,
                  spaceBetweenMax,
                  updatedAtWidget,
                  spaceBetweenMax,
                  pushedAtWidget,
                  spaceBetweenMax,
                  visibilityWidget,
                  spaceBetweenMax,
                  starsWidget,
                  spaceBetweenMax,
                  forksWidget,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
