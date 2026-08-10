import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_state.dart';
import 'package:e_commerce/features/orders/presentation/widgets/filter_chips_row.dart';
import 'package:e_commerce/features/orders/presentation/widgets/order_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = S.of(context);

    return Column(
      children: [
        _SearchField(),
        vGap(12),
        FilterChipsRow(),
        vGap(12),
        Expanded(
          child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
            builder: (context, state) {
              if (state is GetOrdersFailure) {
                return Center(
                  child: Text(
                    l10n.ordersError(state.message),
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface.withValues(alpha: 0.55),
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }
              if (state is GetOrdersSuccess) {
                final orders = state.orders;
                if (orders.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.noOrdersFound,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurface.withValues(alpha: 0.55),
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderCard(order: orders[index]),
                    );
                  },
                );
              }
              return Skeletonizer(
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderCard(order: Order.placeHolder()),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          onChanged: (query) => context.read<GetOrdersCubit>().onSearchChanged(
            searchQuery: query,
          ),
          decoration: InputDecoration(
            hintText: S.of(context).search_order_by_number,
            prefixIcon: Icon(Icons.search_sharp),
          ),
        ),
      ),
    );
  }
}
