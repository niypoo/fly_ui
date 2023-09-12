import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/widgets.dart';
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
                width: context.width * 0.4,
                height: context.width * 0.4,
              ),
            ),
          Text(
            title,
            style: Get.textTheme.titleLarge,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          Text(
            body,
            style: Get.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
