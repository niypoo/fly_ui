import 'package:flutter/material.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:get/get.dart';

class FlyTabsBar extends StatelessWidget {
  const FlyTabsBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  final TabController tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      tabAlignment: TabAlignment.start,
      controller: tabController,
      padding: EdgeInsets.only(bottom: 10.sp),
      indicatorColor: Get.theme.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: Get.textTheme.labelLarge!.copyWith(
        color: Get.theme.primaryColor,
      ),
      labelColor: Get.theme.primaryColor,
      unselectedLabelStyle: Get.textTheme.labelMedium,
      isScrollable: true,
      labelPadding: EdgeInsetsDirectional.only(end: 12.sp),
      tabs: tabs,
    );
  }
}
