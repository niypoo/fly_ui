// import 'package:flutter/material.dart';
// import 'package:patata_responsive/patata_responsive.dart';
// import 'package:get/get.dart';

// class FlyElevatedFlexibleButton extends StatelessWidget {
//   const FlyElevatedFlexibleButton({
//     Key? key,
//     required this.title,
//     this.onPressed,
//     this.color,
//     this.textColor,
//   }) : super(key: key);

//   factory FlyElevatedFlexibleButton.normal({
//     required String title,
//     required Function onPressed,
//   }) =>
//       FlyElevatedFlexibleButton(
//         color: Get.theme.cardColor,
//         title: title,
//         onPressed: onPressed,
//       );

//   factory FlyElevatedFlexibleButton.close({
//     required String title,
//     required Function onPressed,
//   }) =>
//       FlyElevatedFlexibleButton(
//         color: Get.theme.cardColor,
//         title: title,
//         onPressed: onPressed,
//       );

//   factory FlyElevatedFlexibleButton.primary({
//     required String title,
//     required Function onPressed,
//   }) =>
//       FlyElevatedFlexibleButton(
//         color: Get.theme.primaryColor,
//         textColor: Get.theme.secondaryHeaderColor,
//         title: title,
//         onPressed: onPressed,
//       );

//   final String title;
//   final Function? onPressed;
//   final Color? color;
//   final Color? textColor;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed as void Function()?,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: color != null
//             ? color!.withOpacity(0.3)
//             : Get.theme.primaryColor.withOpacity(0.3),
//         backgroundColor: color ?? Get.theme.primaryColor,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.sp),
//         ),
//       ),
//       child: Text(
//         title,
//         style: Get.textTheme.titleMedium!.copyWith(
//           color: textColor,
//           fontSize: 11.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
