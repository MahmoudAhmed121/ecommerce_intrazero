import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final Widget placeholderWidget;
  final double? radius;
  final BoxFit fit;
  final bool? changeErrorWidget;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    required this.placeholderWidget,
    this.fit = BoxFit.cover,
    this.radius = 5,
    this.changeErrorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      width: width,
      placeholder: (context, message) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: placeholderWidget,
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius!),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      errorWidget: (context, message, error) {
        return changeErrorWidget != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://as1.ftcdn.net/v2/jpg/05/16/27/58/1000_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg',
                ),
              )
            : const Icon(Icons.error_outline_rounded);
      },
    );
  }
}
