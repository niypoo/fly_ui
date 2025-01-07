// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:fly_ui/views/widgets/autocomplete.widget.dart';
// import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';

// class FlyAutocompleteTile extends StatelessWidget {
//   const FlyAutocompleteTile({
//     Key? key,
//     required this.onSelected,
//     required this.placeholder,
//      this.initialValue,
//     this.autocomplete,
//     this.validator,
//     this.bgColor,
//     this.child,
//     this.outline = false,
//   }) : super(key: key);

//   final String placeholder;
//   final String? initialValue;
//   final dynamic Function(String) onSelected;
//   final bool outline;
//   final Color? bgColor;
//   final Widget? child;
//   final String? Function(String?)? validator;
//   final FutureOr<Iterable<String>> Function(String)? autocomplete;

//   @override
//   Widget build(BuildContext context) {
//     return FlyInputTileWrap(
//       leading: FlyAutocomplete(
//         initialValue:initialValue,
//         placeholder: placeholder,
//         search: autocomplete,
//         onSelected: onSelected,
//         validator: validator,
//       ),
//       title: placeholder,
//       outline: outline,
//       bgColor: bgColor,
//       child: child,
//     );
//   }
// }
