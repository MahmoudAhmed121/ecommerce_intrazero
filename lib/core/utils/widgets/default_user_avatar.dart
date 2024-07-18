import 'dart:io';

import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';

class DefaultAvatar extends StatelessWidget {
  final String? imageFile;
  final String? imageUrl;

  final String? imageAsset;

  final double size;

  final double padding;

  const DefaultAvatar({
    super.key,
    this.imageFile,
    this.imageUrl,
    this.imageAsset,
    this.size = 52,
    this.padding = 10,
  }) : assert(
          (imageFile != null && imageUrl == null && imageAsset == null) ||
              (imageFile == null && imageUrl != null && imageAsset == null) ||
              (imageFile == null && imageUrl == null && imageAsset != null) ||
              (imageFile == null && imageUrl == null && imageAsset == null),
          'You cannot set more than one image source, either imageFile, imageUrl or imageAsset',
        );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: CircleAvatar(
            radius: size + 1,
            backgroundColor: AppColor.kTextColor,
            child: _buildImage(),
          ),
        ),
      ],
    );
  }

  CircleAvatar _buildImage() {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: size,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }
    if (imageFile != null) {
      return CircleAvatar(
        radius: size,
        backgroundImage: FileImage(File(imageFile!)),
      );
    }

    if (imageAsset != null) {
      return CircleAvatar(
        radius: size,
        backgroundImage: AssetImage(imageAsset!),
      );
    }

    return CircleAvatar(
      radius: size,
      backgroundColor: AppColor.kPrimaryColor,
      backgroundImage: const AssetImage(
        'assets/images/logo.png',
      ),
    );
  }
}
