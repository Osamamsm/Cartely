import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/features/settings/presentation/views/settings_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerButtonsRow extends StatelessWidget {
  const DrawerButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _CustomDrawerButton(
            icon: Icons.person_outline,
            label: S.of(context).profile,
            onTap: () {
              GoRouter.of(context).push(ProfileView.routeName);
            },
          ),
        ),
        hGap(12),
        Expanded(
          child: _CustomDrawerButton(
            icon: Icons.settings_outlined,
            label: S.of(context).settings,
            onTap: () {
              GoRouter.of(context).push(SettingsView.routeName);
            },
          ),
        ),
      ],
    );
  }
}

class _CustomDrawerButton extends StatelessWidget {
  const _CustomDrawerButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 28,
            ),
          ),
          vGap(5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
