import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';

class FlyTabsBar extends StatelessWidget {
  const FlyTabsBar({
    Key? key,
    required this.tabController,
    required this.tabs,
  }) : super(key: key);

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
      labelStyle: Get.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 11.sp,
        color: Get.theme.primaryColor,
      ),
      labelColor: Get.theme.primaryColor,
      unselectedLabelColor: Get.textTheme.titleLarge!.color!.withOpacity(0.3),
      isScrollable: true,
      labelPadding: EdgeInsetsDirectional.only(end: 12.sp),
      tabs: tabs,
    );
  }
}
