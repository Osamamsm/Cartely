import 'package:e_commerce/core/widgets/cart_button.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/features/home/presentation/widgets/custom_drawer.dart';
import 'package:e_commerce/features/home/presentation/widgets/home_view_body.dart';
import 'package:e_commerce/features/profile/presentation/logic/cubit/profile_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
    return SafeArea(
      child: CustomScaffold(
        title: S.of(context).app_name,
        drawer: const CustomDrawer(),
        actionWidgets: [
          const CartButton(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
