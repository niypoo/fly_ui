import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/stepper/stepper.controller.dart';
import 'package:fly_ui/views/widgets/stepper/widgets/stepperProgress.widget.dart';
import 'package:get/get.dart';

class FlyStepperView extends StatelessWidget {
  const FlyStepperView({
    super.key,
    required this.screens,
  });

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      child: GetBuilder<FlyStepperController>(
        init: FlyStepperController(),
        builder: (controller) {
          return Column(
            children: [
              // Progress
              FlyStepperProgress(
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
