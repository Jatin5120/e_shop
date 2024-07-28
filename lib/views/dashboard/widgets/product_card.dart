import 'package:e_shop/di/di.dart';
import 'package:e_shop/models/models.dart';
import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.product, {
    super.key,
  });

  final ProductModel product;

  DashboardProvider get _provider => kGetIt<DashboardProvider>();
  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AppImage(
                    product.thumbnail,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      product.description,
                      style: context.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                        children: [
                          TextSpan(
                            text: '\$${product.price}',
                            style: TextStyle(
                              decoration: _provider.showDiscountPrice ? TextDecoration.lineThrough : null,
                              decorationColor: _provider.showDiscountPrice ? AppColors.grey : null,
                              color: _provider.showDiscountPrice ? AppColors.grey : AppColors.text,
                            ),
                          ),
                          if (_provider.showDiscountPrice) ...[
                            const WidgetSpan(child: SizedBox(width: 8)),
                            TextSpan(
                              text: '\$${product.discountPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: AppColors.text,
                              ),
                            ),
                            const WidgetSpan(child: SizedBox(width: 8)),
                            TextSpan(
                              text: '${product.discountPercentage.toStringAsFixed(0)}% off',
                              style: const TextStyle(
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
