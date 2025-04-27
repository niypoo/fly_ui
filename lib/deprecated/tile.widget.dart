// import 'package:flutter/material.dart';
// import 'package:fly_ui/extensions/responsive.extension.dart';
// import 'package:get/get.dart';

// class FlyListTile extends StatelessWidget {
//   const FlyListTile({
//     Key? key,
//     required this.title,
//     this.value,
//     this.leading,
//     this.subtitle,
//     this.onTap,
//     this.enableDivider = true,
//     this.colorDivider,
//   }) : super(key: key);

//   final Widget? leading;
//   final String title;
//   final dynamic value;
//   final dynamic subtitle;
//   final bool enableDivider;
//   final Color? colorDivider;
//   final Function? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           onTap: onTap as void Function()?,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.sp),
//           ),
//           contentPadding: const EdgeInsets.all(0),
//           leading: leading,
//           title: Text(
//             title,
//             style: Get.textTheme.bodyLarge!.copyWith(
//               fontWeight: FontWeight.bold,
//               fontSize: 11.sp,
//             ),
//           ),
//           subtitle: subtitle is String
//               ? Text(
//                   subtitle,
//                   style: Get.textTheme.labelLarge!
//                       .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w300),
//                 )
//               : subtitle,
//           trailing: value is String
//               ? Text(
//                   value,
//                   style: Get.textTheme.bodySmall!.copyWith(
//                     fontSize: 10.sp,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 )
//               : value,
//         ),
//         if (enableDivider)
//           Divider(
//             color: colorDivider ?? Get.theme.cardColor,
//             indent: 40.sp,
//           ),
//       ],
//     );
//   }
// }
