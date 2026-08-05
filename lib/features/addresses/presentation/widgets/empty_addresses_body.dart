import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/add_new_address_button.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmptyAddressesBody extends StatelessWidget {
  const EmptyAddressesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_off_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.outline,
            ),
            vGap(24),
            Text(
              S.of(context).no_addresses_found,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            vGap(8),
            Text(
              S.of(context).add_address_to_continue_checkout,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            vGap(32),
            const AddNewAddressButton(),
          ],
        ),
      ),
    );
  }
}
