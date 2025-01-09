import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/chip.widget.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:fly_ui/views/widgets/listTile/inputTileWrap.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

/// A widget that allows users to input files.
///
/// This widget provides a user interface for selecting and uploading files.
/// It can be used in forms or any other place where file input is required.
class FileInput {
  final String name;
  final bool image;
  final String path;

  FileInput({
    required this.name,
    required this.path,
    this.image = false,
  });
}

class FlyFileInputTile extends StatelessWidget {
  const FlyFileInputTile({
    Key? key,
    required this.title,
    this.subtitle,
    this.files = const [],
    this.uploadFun,
    this.removeFile,
    this.bgColor,
    this.child,
    this.outline = true,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final List<FileInput> files;
  final Future Function()? uploadFun;
  final Future Function(FileInput)? removeFile;
  final bool outline;
  final Color? bgColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FlyInputTileWrap(
      title: title,
      subtitle: subtitle,
      outline: outline,
      bgColor: bgColor,
      trailing: SizedBox(
        height: 28.sp,
        child: FlyElevatedButton.normal(
          margin: const EdgeInsets.all(0),
          title: 'Upload',
          icon: UniconsLine.upload,
          onPressed: uploadFun,
        ),
      ),
      child: files.isNotEmpty
          ? Wrap(
              children: files
                  .map((file) => FlyChip(
                        avatar: file.image
                            ? FlyImage(
                                width: 30.sp,
                                height: 30.sp,
                                url: file.path,
                              )
                            : null,
                        tag: file.name,
                        backgroundColor:
                            outline ? null : Get.theme.scaffoldBackgroundColor,
                        onRemove:
                            removeFile != null ? () => removeFile!(file) : null,
                      ))
                  .toList(),
            )
          : null,
    );
  }
}
