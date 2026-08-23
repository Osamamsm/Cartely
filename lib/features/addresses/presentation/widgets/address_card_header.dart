import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/default_flag_widget.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/views/edit_address_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressCardHeader extends StatelessWidget {
  const AddressCardHeader({super.key, required this.address});

  final AddressEntity address;

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Home':
        return Icons.home;
      case 'Work':
        return Icons.business;
      case 'Other':
      default:
        return Icons.location_on;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            _getIconForType(address.label),
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20,
          ),
        ),
        hGap(12),
        Text(address.label, style: Theme.of(context).textTheme.titleMedium),
        hGap(8),
        if (address.isDefault) DefaultFlagWidget(),
        const Spacer(),
        CustomPopupMenuButton(
          onEdit: () {
            context.push(EditAddressView.routeName, extra: address);
          },
          onDelete: () {
            showCustomDialog(
              context: context,
              message: "Are you sure ,you want to delete this address",
              dialogType: DialogType.warning,
              onOkPressed: () {
                context.read<AddressesCubit>().deleteAddress(address.id!);
              },
              showCancelBtn: true,

              onCancelPressed: () {},
            );
          },
        ),
      ],
    );
  }
}
