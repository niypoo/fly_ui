import 'package:flutter/material.dart';
import 'package:loading_service/helpers/spinner.helper.dart';
import 'package:paginate_firestore_plus/paginate_firestore.dart';

class FlyFirebaseInfiniteScroll extends StatelessWidget {
  const FlyFirebaseInfiniteScroll({
    super.key,
    required this.emptyWidget,
    required this.query,
    required this.itemBuilder,
    this.itemsPerPage = 15,
    this.isLive = false,
    this.shrinkWrap = false,
    this.valueKey,
    // this.itemsCount,
    this.physics,
    this.padding = const EdgeInsets.all(0),
    this.itemBuilderType = PaginateBuilderType.listView,
  });

  final Widget emptyWidget;
  final dynamic query;
  final Widget Function(dynamic data, int index) itemBuilder;
  final int itemsPerPage;
  final bool isLive;
  final PaginateBuilderType itemBuilderType;
  final ValueKey? valueKey;
  // final int? itemsCount;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return PaginateFirestore(
      // itemsCount: itemsCount,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      key: key,
      //item builder type is compulsory.
      itemBuilder: (context, documentSnapshots, index) =>
          itemBuilder(documentSnapshots[index].data(), index),
      // orderBy is compulsory to enable pagination
      query: query,
      //Change types accordingly
      itemBuilderType: itemBuilderType,
      // to fetch real-time data
      isLive: isLive,
      // per page
      itemsPerPage: itemsPerPage,
      onEmpty: Padding(padding: padding, child: emptyWidget),
      initialLoader: Padding(
        padding: padding,
        child: SpinnerHelper.verticalTextSpinner(),
      ),
      bottomLoader: Padding(
        padding: padding,
        child: SpinnerHelper.horizontalTextSpinner(),
      ),
    );
  }
}
