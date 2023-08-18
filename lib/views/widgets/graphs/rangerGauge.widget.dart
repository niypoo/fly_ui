// import 'package:app_configuration_service/appInfo.config.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class RangerGaugeCard extends StatelessWidget {
//   const RangerGaugeCard({
//     Key key,
//     @required this.title,
//     @required this.label,
//     @required this.value,
//     @required this.maxValue,
//     @required this.leftValue,
//     @required this.percentage,
//     this.thickness = 20.0,
//     this.bgColor,
//     this.color,
//   }) : super(key: key);

//   final double value;
//   final Color color;
//   final Color bgColor;
//   final String title;
//   final String label;
//   final double maxValue;
//   final double percentage;
//   final double leftValue;
//   final double thickness;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         vertical: AppConfigService.to.space.l,
//         horizontal: AppConfigService.to.space.s,
//       ),
//       height: 160,
//       child: Row(
//         children: [
//           Expanded(
//             child: SfRadialGauge(
//               axes: <RadialAxis>[
//                 RadialAxis(
//                   canScaleToFit: true,
//                   radiusFactor: 1.1,
//                   interval: 1,
//                   startAngle: 0,
//                   endAngle: 360,
//                   showTicks: false,
//                   showLabels: false,
//                   axisLineStyle: AxisLineStyle(
//                     thickness: thickness,
//                     color: bgColor,
//                   ),
//                   pointers: <GaugePointer>[
//                     RangePointer(
//                       value: percentage,
//                       width: thickness,
//                       color: color,
//                       enableAnimation: true,
//                       cornerStyle: CornerStyle.bothCurve,
//                       animationDuration: 1000,
//                     ),
//                     MarkerPointer(
//                       animationDuration: 1000,
//                       value: percentage * 0.97,
//                       markerHeight: thickness * 0.5,
//                       markerWidth: thickness * 0.5,
//                       markerType: MarkerType.circle,
//                       color: Colors.white,
//                     )
//                   ],
//                   annotations: <GaugeAnnotation>[
//                     GaugeAnnotation(
//                       widget: Text(
//                         '${percentage.toStringAsFixed(2)}%',
//                         style: Get.textTheme.headline1.copyWith(
//                           color: color,
//                         ),
//                       ),
//                       angle: 270,
//                       positionFactor: 0.1,
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//               child: Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: AppConfigService.to.space.l),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 AutoSizeText(
//                   title,
//                   style: Get.textTheme.titleMedium.copyWith(
//                     color: color,
//                   ),
//                 ),
//                 SizedBox(height: AppConfigService.to.space.xxs),
//                 AutoSizeText.rich(
//                   TextSpan(
//                     text: '${value.toStringAsFixed(0)} $label',
//                     children: [
//                       TextSpan(
//                         text:
//                             ' ${'of'.tr} ${maxValue.toStringAsFixed(0)} $label',
//                         style: Get.textTheme.titleSmall
//                             .copyWith(color: Colors.grey[700]),
//                       )
//                     ],
//                   ),
//                   style: Get.textTheme.titleSmall.copyWith(
//                     color: color,
//                   ),
//                   minFontSize: 9,
//                 ),

//                 // Left Value
//                 if (leftValue != null)
//                   Padding(
//                     padding: EdgeInsets.only(top: AppConfigService.to.space.m),
//                     child: AutoSizeText(
//                       '${leftValue.toStringAsFixed(0)} $label ${'is left'.tr}',
//                       style: Get.textTheme.titleSmall,
//                     ),
//                   ),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
