import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:flutter/material.dart';

class AddressDetailsSection extends StatelessWidget {
  const AddressDetailsSection({super.key, required this.address});

  final AddressEntity address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          getFormattedAddress(address: address),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        vGap(4),
        Text(
          '${address.city} ${address.street}',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        vGap(4),
      ],
    );
  }
}
