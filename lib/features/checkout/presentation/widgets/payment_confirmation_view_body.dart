import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/checkout/presentation/logic/payment_confirmation_cubit/payment_confirmation_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/payment_confirmation_cubit/payment_confirmation_state.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/orders/presentation/views/order_details_view.dart';
import 'package:e_commerce/features/orders/presentation/views/orders_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentConfirmationViewBody extends StatelessWidget {
  const PaymentConfirmationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentConfirmationCubit, PaymentConfirmationState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          switchInCurve: Curves.easeOutCubic,
          child: KeyedSubtree(
            key: ValueKey(state.status),
            child: switch (state.status) {
              ConfirmationStatus.confirming => const _ConfirmingView(),
              ConfirmationStatus.confirmed => _ConfirmedView(
                orderNumber: state.orderNumber!,
                orderId: state.orderId!,
              ),
              ConfirmationStatus.failed => const _FailedView(),
              ConfirmationStatus.timeout => const _TimeoutView(),
            },
          ),
        );
      },
    );
  }
}

/// -------------------- Confirming --------------------

class _ConfirmingView extends StatelessWidget {
  const _ConfirmingView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 72,
              height: 72,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: theme.colorScheme.primary,
              ),
            ),
            vGap(28),
            Text(
              s.paymentConfirmingTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            vGap(8),
            Text(
              s.paymentConfirmingMessage,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// -------------------- Shared result layout --------------------

class _ResultView extends StatelessWidget {
  const _ResultView({
    required this.icon,
    required this.color,
    required this.title,
    required this.message,
    required this.primaryLabel,
    required this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.orderNumber,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String message;
  final String primaryLabel;
  final VoidCallback onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final String? orderNumber;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.6, end: 1),
              duration: const Duration(milliseconds: 450),
              curve: Curves.elasticOut,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 52, color: color),
              ),
            ),
            vGap(24),
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            vGap(10),
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (orderNumber != null) ...[
              vGap(20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  s.orderNumber(orderNumber!),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            vGap(32),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onPrimary,
                style: FilledButton.styleFrom(
                  backgroundColor: color,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(primaryLabel),
              ),
            ),
            if (secondaryLabel != null && onSecondary != null) ...[
              vGap(10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: onSecondary,
                  child: Text(secondaryLabel!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// -------------------- Confirmed --------------------

class _ConfirmedView extends StatelessWidget {
  const _ConfirmedView({required this.orderNumber, required this.orderId});

  final String orderNumber;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return _ResultView(
      icon: Icons.check_circle_rounded,
      color: Colors.green,
      title: s.paymentConfirmedTitle,
      message: s.paymentConfirmedMessage,
      orderNumber: orderNumber,
      primaryLabel: s.viewOrderDetails,
      onPrimary: () {
        context.push(OrderDetailsView.routeName, extra: orderId);
      },
      secondaryLabel: s.continueShopping,
      onSecondary: () {
        context.go(HomeView.routeName);
      },
    );
  }
}

/// -------------------- Failed --------------------

class _FailedView extends StatelessWidget {
  const _FailedView();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return _ResultView(
      icon: Icons.error_rounded,
      color: Colors.red,
      title: s.paymentFailedTitle,
      message: s.paymentFailedMessage,
      primaryLabel: s.tryAgain,
      onPrimary: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.go('/');
        }
      },
      secondaryLabel: s.backToHome,
      onSecondary: () {
        context.go('/');
      },
    );
  }
}

/// -------------------- Timeout --------------------

class _TimeoutView extends StatelessWidget {
  const _TimeoutView();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return _ResultView(
      icon: Icons.hourglass_top_rounded,
      color: Colors.orange,
      title: s.paymentConfirmationDelayedTitle,
      message: s.paymentConfirmationDelayedMessage,
      primaryLabel: s.goToOrders,
      onPrimary: () {
        context.push(OrdersView.routeName);
      },
      secondaryLabel: s.backToHome,
      onSecondary: () {
        context.go('/');
      },
    );
  }
}
