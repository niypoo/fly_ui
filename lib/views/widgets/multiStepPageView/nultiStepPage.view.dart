import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/multiStepPage.controller.dart';
import 'package:fly_ui/views/widgets/multiStepPageView/widgets/mutliStepsProgress.widget.dart';
import 'package:get/get.dart';

class FlyMultiStepPageView extends StatelessWidget {
  const FlyMultiStepPageView({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      child: GetBuilder<FlyMultiStepPageController>(
        init: FlyMultiStepPageController(),
        builder: (controller) {
          return Column(
            children: [
              // Progress
              FlyMultiStepsProgress(
                total: screens.length,
                step: controller.step,
              ),

              // Body
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: screens,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
