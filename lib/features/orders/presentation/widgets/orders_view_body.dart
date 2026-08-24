import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/orders/domain/entity/order.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_cubit.dart';
import 'package:e_commerce/features/orders/presentation/logic/get_orders_cubit/get_orders_state.dart';
import 'package:e_commerce/features/orders/presentation/widgets/filter_chips_row.dart';
import 'package:e_commerce/features/orders/presentation/widgets/order_card.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {

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
                return ErrorBody(
                  errMessage: state.message,
                  onRetry: () => context.read<GetOrdersCubit>().getOrders(),
                  goHomeEnabled: true,
                );
              }
              if (state is GetOrdersSuccess) {
                final orders = state.orders;
                if (orders.isEmpty) {
                  return EmptyBody(
                    icon: Icons.shopping_bag_outlined,
                    title: S.of(context).no_orders,
                    message: S.of(context).no_orders_description,
                    actionLabel: S.of(context).shop_now,
                    onAction: () {
                      context.go(HomeView.routeName);
                    },
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
