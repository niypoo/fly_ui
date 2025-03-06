import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachProgress.widget.dart';
import 'package:get/get.dart';

class FlyCoachView extends StatelessWidget {
  const FlyCoachView({
    Key? key,
    required this.screens,
  }) : super(key: key);

  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      child: GetBuilder<FlyCoachController>(
        init: FlyCoachController(),
        builder: (controller) {
          return Column(
            children: [
              // Progress
              FlyCoachProgress(
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
