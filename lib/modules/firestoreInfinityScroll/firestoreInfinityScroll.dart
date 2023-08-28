import 'package:flutter/material.dart';
import 'package:kr_paginate_firestore/paginate_firestore.dart';
import 'package:loading_service/helpers/spinner.helper.dart';

class FlyFirebaseInfiniteScroll extends StatelessWidget {
  const FlyFirebaseInfiniteScroll({
    super.key,
    required this.emptyWidget,
    required this.query,
    required this.itemBuilder,
    this.itemsPerPage = 10,
    this.isLive = false,
    this.valueKey,
    this.itemBuilderType = PaginateBuilderType.listView,
  });

  final Widget emptyWidget;
  final dynamic query;
  final Widget Function(
          BuildContext context, List<dynamic> documentSnapshots, int index)
      itemBuilder;
  final int itemsPerPage;
  final bool isLive;
  final PaginateBuilderType itemBuilderType;
  final ValueKey? valueKey;

  @override
  Widget build(BuildContext context) {
    return KrPaginateFirestore(
      key: key,
      padding: const EdgeInsets.only(bottom: 50),
      //item builder type is compulsory.
      itemBuilder: itemBuilder,
      // orderBy is compulsory to enable pagination
      query: query,
      //Change types accordingly
      itemBuilderType: PaginateBuilderType.listView,
      // to fetch real-time data
      isLive: isLive,
      // per page
      itemsPerPage: itemsPerPage,
      onEmpty: emptyWidget,
      initialLoader: SpinnerHelper.verticalTextSpinner(),
      bottomLoader: SpinnerHelper.horizontalTextSpinner(),
    );
  }
}
