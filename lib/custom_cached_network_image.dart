import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///CustomCachedNetworkImage class is used for displaying network images with
///caching functionality.
final class CustomNetworkImageSize {
  final double width;
  final double height;

  CustomNetworkImageSize({required this.width, required this.height});
}

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.loadingWidget,
    this.boxFit = BoxFit.cover,
    this.size,
    this.imageSize,
  });

  ///It represents the URL of the image that needs to be displayed.
  final String? imageUrl;

  ///When  image is not  available then display empty widget
  final Widget? emptyWidget;

  ///When  image is loading default [CircularProgressIndicator]
  final Widget? loadingWidget;

  ///Default value is `height:200` `width:200`
  final CustomNetworkImageSize? imageSize;

  ///Default boxFit is [BoxFit.cover]
  final BoxFit? boxFit;

  ///Default image size
  final Size? size;
  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    final cache =
        imageSize ?? CustomNetworkImageSize(height: 200.0, width: 200.0);
    if (url == null && url!.isEmpty) return emptyWidget ?? const SizedBox();
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      width: size?.width,
      height: size?.height,
      errorListener: (value) {
        if (kDebugMode) {
          debugPrint('Error:  $value');
        }
      },
      progressIndicatorBuilder: (context, url, progress) =>
          loadingWidget ?? const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => emptyWidget ?? const SizedBox(),
      memCacheHeight: cache.height.toInt(),
      memCacheWidth: cache.width.toInt(),
    );
  }
}
