import 'package:flutter/widgets.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';

class FlyContainerMessage extends StatelessWidget {
  const FlyContainerMessage({
    Key? key,
    this.image,
    required this.body,
    required this.title,
  }) : super(key: key);

  final String title;
  final String body;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null)
            Center(
              child: FlyImage(
                url: image,
                width: 40.sp,
                height: 40.sp,
              ),
            ),
          Text(
            title,
            style: Get.textTheme.titleLarge!.copyWith(
              fontSize: 11.sp,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          Text(
            body,
            style: Get.textTheme.titleSmall!.copyWith(
              fontSize: 9.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
