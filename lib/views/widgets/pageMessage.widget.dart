import 'package:flutter/widgets.dart';
import 'package:patata_responsive/patata_responsive.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:get/get.dart';

class FlyContainerMessage extends StatelessWidget {
  const FlyContainerMessage({
    Key? key,
    this.image,
    required this.body,
    required this.title,
    this.icon,
    this.actions,
  }) : super(key: key);

  final String title;
  final String body;
  final String? image;
  final IconData? icon;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // IMAGE
          if (image != null)
            Center(
              child: FlyImage(
                url: image!,
                width: 47.sp,
                height: 47.sp,
              ),
            ),
          
          // ICON
          if (icon != null)
            Center(
              child: Icon(
                icon!,
                size: 47.sp,
                color: Get.theme.cardColor,
              ),
            ),
            
          SizedBox(height: 10.sp),
          
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
          SizedBox(height: 10.sp),

          if(actions!=null) ...actions!,
        ],
      ),
    );
  }
}
