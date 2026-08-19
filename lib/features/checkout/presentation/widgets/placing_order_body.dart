import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

/// Shown while placeOrder() is in flight.
class PlacingOrderBody extends StatelessWidget {
  const PlacingOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        const _PulsingLoader(),
        vGap(32),
        Text(
          S.of(context).placing_order,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        vGap(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            S.of(context).please_wait_while_we_process_your_order,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Spacer(flex: 3),
        vGap(24),
      ],
    );
  }
}

class _PulsingLoader extends StatefulWidget {
  const _PulsingLoader();

  @override
  State<_PulsingLoader> createState() => _PulsingLoaderState();
}

class _PulsingLoaderState extends State<_PulsingLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(blurRadius: 40, spreadRadius: 10)],
      ),
      child: Center(
        child: SizedBox(
          width: 60,
          height: 60,
          child: RotationTransition(
            turns: _controller,
            child: const CircularProgressIndicator(
              strokeWidth: 3,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
