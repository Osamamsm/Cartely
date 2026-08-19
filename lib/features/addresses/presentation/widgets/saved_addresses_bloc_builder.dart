import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/error_body.dart';
import 'package:e_commerce/features/addresses/domain/entities/address_entity.dart';
import 'package:e_commerce/features/addresses/presentation/logic/addresses_cubit/addresses_cubit.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/address_card.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/saved_addresses_view_body.dart';
import 'package:e_commerce/features/addresses/presentation/widgets/empty_addresses_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SavedAddressesBlocBuilder extends StatelessWidget {
  const SavedAddressesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      buildWhen: (previous, current) =>
          current.action == AddressesAction.getAddresses,
      builder: (context, state) {
        if (state.status == AddressesStatus.failure &&
            state.action == AddressesAction.getAddresses) {
          return ErrorBody(
            onRetry: () {
              context.read<AddressesCubit>().getAddresses();
            },
            errMessage: state.errorMessage ?? '',
            goHomeEnabled: true,
          );
        }
        if (state.addresses.isNotEmpty) {
          return SavedAddressesViewBody(addresses: state.addresses);
        }
        if (state.status == AddressesStatus.success &&
            state.action == AddressesAction.getAddresses &&
            state.addresses.isEmpty) {
          return EmptyAddressesBody();
        }
        return _LoadingBody();
      },
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Skeletonizer(
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AddressCard(
              address: AddressEntity(
                id: '',
                label: 'label',
                governorate: 'governorate',
                city: 'city',
                street: 'street',
                building: 'building',
                apartmentNumber: 10,
                isDefault: false,
                district: 'district',
                floor: 5,
                additionalNotes: 'additionalNotes',
              ),
            );
          },
          separatorBuilder: (context, index) => vGap(16),
        ),
      ),
    );
  }
}
