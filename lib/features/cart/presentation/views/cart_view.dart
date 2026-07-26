import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/helpers/functions.dart';
import 'package:e_commerce/core/widgets/custom_scaffold.dart';
import 'package:e_commerce/core/widgets/show_error_dialog.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_view_bloc_builder.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = '/cart-view';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: S.of(context).my_cart,
      actionWidgets: [_ClearCartButton()],
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state.status == CartStatus.operationSuccess) {
            showCartSnackBar(
              context: context,
              message: state.message!,
              backgroundColor: Colors.green.shade600,
              icon: Icons.check_circle_outline,
            );
          } else if (state.status == CartStatus.operationFailure) {
            showCartSnackBar(
              context: context,
              message: state.message!,
              backgroundColor: Colors.red.shade600,
              icon: Icons.error_outline,
            );
          } else if (state.status == CartStatus.error) {
            showCartSnackBar(
              context: context,
              message: state.message!,
              backgroundColor: Colors.red.shade600,
              icon: Icons.error_outline,
            );
          }
        },
        child: const CartViewBlocBuilder(),
      ),
    );
  }
}

class _ClearCartButton extends StatelessWidget {
  const _ClearCartButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showCustomDialog(
        context: context,
        dialogType: DialogType.warning,
        message: S.of(context).clear_cart_confirmation,
        okBtnText: S.of(context).yes,
        showCancelBtn: true,
        cancelBtnText: S.of(context).no,
        onOkPressed: () => context.read<CartCubit>().clearCart(),
      ),
      icon: const Icon(Icons.delete),
    );
  }
}
