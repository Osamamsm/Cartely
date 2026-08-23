import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Theme.of(context).colorScheme.primaryContainer,
      onSelected: (value) {
        switch (value) {
          case 'edit':
            onEdit();
            break;
          case 'delete':
            onDelete();
            break;
        }
      },
      itemBuilder: (context) => [
        CustomPopupMenuItem(
          value: 'edit',
          icon: Icons.edit,
          text: S.of(context).edit,
        ),
        CustomPopupMenuItem(
          value: 'delete',
          icon: Icons.delete,
          text: S.of(context).delete,
        ),
      ],
    );
  }
}

class CustomPopupMenuItem extends PopupMenuItem<String> {
  CustomPopupMenuItem({
    super.key,
    required String value,
    required IconData icon,
    required String text,
  }) : super(
         value: value,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [Icon(icon), hGap(8), Text(text)],
         ),
       );
}
