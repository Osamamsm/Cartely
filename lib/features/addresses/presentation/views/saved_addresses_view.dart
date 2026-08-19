import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/addresses/presentation/views/add_address_view.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/saved_addresses_bloc_builder.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SavedAddressesView extends StatelessWidget {
  const SavedAddressesView({super.key});

  static String routeName = '/saved-addresses-view';
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_addresses,
      actionWidgets: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AddAddressView.routeName);
          },
          icon: const Icon(Icons.add),
        ),
      ],
      child: SavedAddressesBlocBuilder(),
    );
  }
}
