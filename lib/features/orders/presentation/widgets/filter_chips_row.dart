import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterChipsRow extends StatefulWidget {
  const FilterChipsRow({super.key});

  @override
  State<FilterChipsRow> createState() => _FilterChipsRowState();
}

class _FilterChipsRowState extends State<FilterChipsRow> {
  OrderStatus? _selectedFilter;

  static const _filters = [
    null,
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.processing,
    OrderStatus.shipped,
    OrderStatus.delivered,
    OrderStatus.outForDelivery,
    OrderStatus.cancelled,
    OrderStatus.returned,
  ];

  String _getFilterLabel(BuildContext context, OrderStatus? filter) {
    final s = S.of(context);

    return switch (filter) {
      null => s.all,
      OrderStatus.pending => s.pending,
      OrderStatus.confirmed => s.confirmed,
      OrderStatus.processing => s.processing,
      OrderStatus.shipped => s.shipped,
      OrderStatus.delivered => s.delivered,
      OrderStatus.outForDelivery => s.outForDelivery,
      OrderStatus.cancelled => s.cancelled,
      OrderStatus.returned => s.returned,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final filter = _filters[index];

          return _FilterChip(
            label: _getFilterLabel(context, filter),
            selected: _selectedFilter == filter,
            onTap: () {
              setState(() {
                _selectedFilter = filter;
              });

              context.read<GetOrdersCubit>().getOrders(
                orderStatusFilter: filter?.value,
              );
            },
          );
        },
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          border: Border.all(
            color: selected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSecondary,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
