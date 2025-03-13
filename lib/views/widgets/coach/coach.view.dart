import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/widgets/appBar.widget.dart';
import 'package:fly_ui/views/widgets/coach/coach.controller.dart';
import 'package:fly_ui/views/widgets/coach/widgets/coachProgress.widget.dart';
import 'package:get/get.dart';

class FlyCoachView extends StatelessWidget {
  const FlyCoachView({
    Key? key,
    required this.screens,
    this.progressBar = true,
    this.appBar = false,
  }) : super(key: key);

  final List<Widget> screens;
  final bool progressBar;
  final bool appBar;

  @override
  Widget build(BuildContext context) {
    return FlyScaffold.padding(
      child: GetBuilder<FlyCoachController>(
        init: FlyCoachController(),
        builder: (controller) {
          return Column(
            children: [
              // Progress
              if (progressBar)
                FlyCoachProgress(
                  total: screens.length,
                  step: controller.step,
                ),

              // App bar
              if (appBar) const FlyAppBar(disabledPadding: true,),

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
