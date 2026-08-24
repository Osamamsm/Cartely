import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/empty_body.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/views/add_address_view.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_cubit/checkout_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/logic/checkout_flow_cubit/checkout_flow_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/add_new_address_button.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/address_details_section.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/continue_button.dart';
import 'package:e_commerce/features/checkout/presentation/widgets/selectable_card_widget.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddressStep extends StatelessWidget {
  const AddressStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        if (state.status == AddressesStatus.failure) {
          return Center(
            child: Text(
              "error",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        } else if (state.status == AddressesStatus.success) {
          if (state.addresses.isEmpty) {
            return EmptyBody(
              icon: Icons.location_on,
              title: S.of(context).no_addresses_found,
              message: S.of(context).no_addresses_found_message,
              actionLabel: S.of(context).add_address,
              onAction: () {
                context.push(AddAddressView.routeName);
              },
            );
          } else {
            final addresses = state.addresses;
            return _AddressesSelectorList(addresses: addresses);
          }
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}

class _AddressesSelectorList extends StatefulWidget {
  const _AddressesSelectorList({required this.addresses});

  final List<AddressEntity> addresses;

  @override
  State<_AddressesSelectorList> createState() => _AddressesSelectorListState();
}

class _AddressesSelectorListState extends State<_AddressesSelectorList> {
  late AddressEntity selectedAddress;

  @override
  initState() {
    super.initState();
    selectedAddress = widget.addresses
        .where((address) => address.isDefault)
        .first;
  }

  @override
  Widget build(BuildContext context) {
    context.read<CheckoutCubit>().setAddress(
      widget.addresses.firstWhere(
        (address) => address.id == selectedAddress.id,
      ),
    );
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).shipping_to,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                          letterSpacing: 1.2,
                        ),
                      ),
                      vGap(16),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverList.separated(
                  itemCount: widget.addresses.length,
                  itemBuilder: (context, index) {
                    final address = widget.addresses[index];
                    return _AddressSelectableCard(
                      address: address,
                      isSelected: address.id == selectedAddress.id,
                      onTap: () {
                        context.read<CheckoutCubit>().setAddress(address);
                        setState(() {
                          selectedAddress = address;
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) => vGap(16),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: SliverToBoxAdapter(child: AddNewAddressButton()),
              ),
            ],
          ),
        ),
        ContinueButton(
          label: S.of(context).continue_to_payment,
          onPressed: () {
            context.read<CheckoutFlowCubit>().goToNextStep();
          },
        ),
      ],
    );
  }
}

class _AddressSelectableCard extends StatelessWidget {
  final AddressEntity address;
  final bool isSelected;
  final VoidCallback onTap;

  const _AddressSelectableCard({
    required this.address,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableCardWidget(
      isSelected: isSelected,
      onTap: onTap,
      icon: address.label == 'home' ? Icons.home : Icons.business,
      child: AddressDetailsSection(address: address),
    );
  }
}
