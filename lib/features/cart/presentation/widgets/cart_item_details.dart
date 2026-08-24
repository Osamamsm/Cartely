import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_item.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key, required this.cartItem});
  final CartItem cartItem;

  

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            Localizations.localeOf(context).languageCode == 'ar'
                ? cartItem.productArName
                : cartItem.productEnName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(height: 1.3),
          ),

          if (getVariationsText(context, cartItem).isNotEmpty)
            Text(
              getVariationsText(context, cartItem),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

          const SizedBox(height: 4),

          Text(
            '${cartItem.price.toStringAsFixed(2)} ${S.of(context).egp}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          Text(
            '${s.total}: ${cartItem.lineSubtotal.toStringAsFixed(2)} ${S.of(context).egp}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
