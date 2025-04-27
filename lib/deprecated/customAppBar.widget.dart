// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:fly_ui/extensions/responsive.extension.dart';
// import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
// import 'package:get/get.dart';

// class FlyCustomAppBar extends StatelessWidget {
//   const FlyCustomAppBar({
//     Key? key,
//     this.title,
//     this.actions = const [],
//     this.leading,
//     this.startPadding = 0,
//   }) : super(key: key);

//   final String? title;
//   final List<Widget> actions;
//   final Widget? leading;
//   final double startPadding;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsetsDirectional.only(start: startPadding.sp),
//       child: Row(
//         children: [
//           Padding(
//             padding: EdgeInsetsDirectional.only(end: 10.sp),
//             child: FlyIconButton(
//               icon: Icons.arrow_back,
//               onPressed: () => Get.back(),
//             ),
//           ),
//           Flexible(
//             child: AutoSizeText(
//               title ?? '',
//               style: Get.textTheme.headlineMedium!.copyWith(
//                 fontSize: 20.sp,
//                 color: Get.theme.primaryColor,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.start,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.only(start: 10.sp),
//             child: Wrap(
//               spacing: 5,
//               runSpacing: 5,
//               alignment: WrapAlignment.end,
//               runAlignment: WrapAlignment.end,
//               children: actions,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
