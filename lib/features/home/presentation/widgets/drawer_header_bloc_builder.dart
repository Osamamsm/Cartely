import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/widgets/custom_error_header.dart';
import 'package:e_commerce/features/profile/domain/entities/user_profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DrawerHeaderBlocBuilder extends StatelessWidget {
  const DrawerHeaderBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return _CustomDrawerHeader(
            userProfileEntity: state.userProfileEntity,
          );
        } else if (state is ProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: _CustomDrawerHeader(
              userProfileEntity: UserProfileEntity(
                id: '',
                fullName: 'Loading User',
                email: 'Loading User',
                avatarUrl: null,
                role: '',
                createdAt: DateTime.now(),
              ),
            ),
          );
        } else if (state is ProfileError) {
          return const CustomErrorHeader();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _CustomDrawerHeader extends StatelessWidget {
  const _CustomDrawerHeader({required this.userProfileEntity});

  final UserProfileEntity userProfileEntity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: theme.colorScheme.primaryContainer,
            backgroundImage: userProfileEntity.avatarUrl != null
                ? CachedNetworkImageProvider(userProfileEntity.avatarUrl!)
                : CachedNetworkImageProvider(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                  ),
          ),
        ),
        vGap(12),
        Text(
          userProfileEntity.fullName.isNotEmpty
              ? userProfileEntity.fullName
              : S.of(context).guest_user,
          style: theme.textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (userProfileEntity.role.isNotEmpty) ...[
          vGap(6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              S.of(context).customer,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}
