import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:flutter/material.dart';

class AddressSummary extends StatelessWidget {
  final AddressEntity address;

  const AddressSummary({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              address.label == 'Home' ? Icons.home : Icons.business,
              color: Theme.of(context).colorScheme.primary,
              size: 18,
            ),
          ),
          hGap(12),
          AddressDetailsSection(address: address),
        ],
      ),
    );
  }
}
