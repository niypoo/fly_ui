// import 'package:app_config/appInfo.config.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fly_ui/views/widgets/containers/container.widget.dart';
// import 'package:fly_ui/views/widgets/inkWell.widget.dart';
// import 'package:get/get.dart';

// class FlyCustomButtonSheetButton extends StatelessWidget {
//   const FlyCustomButtonSheetButton({
//     Key key,
//     @required this.onTap,
//     @required this.title,
//     @required this.icon,
//     this.bgColor,
//     this.textColor,
//   }) : super(key: key);

//   final Function onTap;
//   final IconData icon;
//   final String title;
//   final Color bgColor;
//   final Color textColor;

//   @override
//   Widget build(BuildContext context) {
//     return FlyInkWell(
//       onTap: onTap,
//       child: SizedBox(
//         height: 120,
//         width: 70,
//         child: FlyContainer(
//           radius: AppConfigService.to.radius,
//           color: bgColor,
//           padding: EdgeInsets.symmetric(
//             vertical: AppConfigService.to.space.m,
//             horizontal: AppConfigService.to.space.s,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Icon(
//                 icon,
//                 color: textColor ?? Get.theme.accentIconTheme.color,
//               ),
//               AutoSizeText(
//                 title,
//                 style: Get.textTheme.titleSmall.copyWith(
//                   color: textColor ?? Get.textTheme.titleSmall.color,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 maxLines: 1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
