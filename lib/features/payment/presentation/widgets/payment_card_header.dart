import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/default_flag_widget.dart';
import 'package:e_commerce/core/widgets/custom_popup_menu_button.dart';
import 'package:e_commerce/features/payment/presentation/widgets/master_card_logo.dart';
import 'package:flutter/material.dart';

class PaymentCardHeader extends StatelessWidget {
  const PaymentCardHeader({
    super.key,
    required this.type,
    required this.cardLogo,
    required this.isDefault,
  });

  final String type;
  final String cardLogo;
  final bool isDefault;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (type == 'mastercard')
          MasterCardLogo()
        else
          Text(
            cardLogo,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontStyle: FontStyle.italic),
          ),
        Row(
          children: [
            if (isDefault) DefaultFlagWidget(),
            hGap(8),
            CustomPopupMenuButton(
              onEdit: () {},
              onDelete: () {},
            ),
          ],
        ),
      ],
    );
  }
}
