import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const NetImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  bool get _isSvg => url.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (_isSvg) {
      return SvgPicture.network(
        url,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (context) =>
        const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image),
      );
    }
  }
}
