import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
  });

  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        cacheKey: imageUrl,
        height: height,
        width: width,
        placeholder: (context, url) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
          ),
          child: const SizedBox(
            child: UnconstrainedBox(
              child: AppLogo(),
            ),
          ),
        ),
      );
}
