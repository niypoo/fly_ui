// import 'package:flutter/material.dart';
// import 'package:patata_responsive/patata_responsive.dart';
// import 'package:get/get.dart';

// class FlyElevatedIconButton extends StatelessWidget {
//   const FlyElevatedIconButton({
//     Key? key,
//     required this.title,
//     required this.icon,
//     this.onPressed,
//     this.margin,
//     this.bgColor,
//     this.textColor,
//   }) : super(key: key);

//   factory FlyElevatedIconButton.primary({
//     IconData? icon,
//     String? title,
//     Function? onPressed,
//   }) =>
//       FlyElevatedIconButton(
//         bgColor: Get.theme.primaryColor,
//         textColor: Get.theme.secondaryHeaderColor,
//         icon: icon,
//         title: title,
//         onPressed: onPressed,
//       );

//   factory FlyElevatedIconButton.normal({
//     IconData? icon,
//     String? title,
//     Function? onPressed,
//   }) =>
//       FlyElevatedIconButton(
//         bgColor: Get.theme.cardColor,
//         textColor: Get.textTheme.bodyLarge!.color,
//         icon: icon,
//         title: title,
//         onPressed: onPressed,
//       );

//   factory FlyElevatedIconButton.text({
//     IconData? icon,
//     String? title,
//     Function? onPressed,
//   }) =>
//       FlyElevatedIconButton(
//         bgColor: Get.theme.scaffoldBackgroundColor,
//         textColor: Get.textTheme.bodyLarge!.color,
//         icon: icon,
//         title: title,
//         onPressed: onPressed,
//       );

//   final String? title;
//   final Function? onPressed;
//   final Color? bgColor;
//   final Color? textColor;
//   final IconData? icon;
//   final EdgeInsets? margin;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width,
//       margin: margin ?? EdgeInsets.symmetric(horizontal: 0, vertical: 5.sp),
//       child: ElevatedButton.icon(
//         onPressed: onPressed as void Function()?,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: bgColor ?? Get.theme.cardColor,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.sp),
//           ),
//           padding: EdgeInsets.symmetric(
//             vertical: 5.sp,
//           ),
//           foregroundColor: bgColor != null
//               ? bgColor!.withOpacity(0.3)
//               : Get.theme.primaryColor.withOpacity(0.3),
//         ),
//         label: Text(
//           title!,
//           style: Get.textTheme.titleMedium!.copyWith(
//             color: textColor,
//             fontSize: 11.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         icon: Icon(
//           icon,
//           color: textColor,
//           size: 14.sp,
//         ),
//       ),
//     );
//   }
// }
