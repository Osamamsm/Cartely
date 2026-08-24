import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_menu_item.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_buttons_row.dart';
import 'package:e_commerce/features/home/presentation/widgets/drawer_header_bloc_builder.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      width: 250,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: SafeArea(
        child: Column(
          children: [
            RepaintBoundary(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const DrawerHeaderBlocBuilder(),
                    vGap(16),
                    const DrawerButtonsRow(),
                  ],
                ),
              ),
            ),
            const _DrawerQuickAccessMenu(),
            const _CustomDrawerFooter(),
          ],
        ),
      ),
    );
  }
}

class _DrawerQuickAccessMenu extends StatelessWidget {
  const _DrawerQuickAccessMenu();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(color: theme.colorScheme.secondary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              S.of(context).quick_access,
              style: theme.textTheme.labelSmall,
            ),
          ),
          ...Constants.getMenuItems(context).map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomMenuItem(
                icon: e.icon,
                label: e.label,
                onTap: e.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomDrawerFooter extends StatelessWidget {
  const _CustomDrawerFooter();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        image: AssetImage(
          Theme.of(context).brightness == Brightness.light
              ? "assets/logo/dark_on_light_logo.png"
              : "assets/logo/light_on_dark_logo.png",
        ),
        height: 65,
        width: 65,
      ),
    );
  }
}
