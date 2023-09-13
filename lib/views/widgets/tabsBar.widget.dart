import 'package:flutter/material.dart';
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
    return Container(
      color: Get.theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.only(bottom: 10),
      child: TabBar(
        controller: tabController,
        indicatorColor: Get.theme.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
        labelStyle: Get.textTheme.titleMedium,
        labelColor: Get.theme.primaryColor,
        unselectedLabelColor: Get.textTheme.titleLarge!.color!.withOpacity(0.3),
        isScrollable: true,
        labelPadding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 11,
        ),
        tabs: tabs,
      ),
    );
  }
}
