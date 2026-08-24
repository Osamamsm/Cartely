import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/features/auth/presentation/logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/email_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            vGap(10),
            Text(
              S.of(context).forgot_password_subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            vGap(20),
            EmailTextField(
              onSaved: (value) {
                email = value!;
              },
            ),
            vGap(20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<ForgotPasswordCubit>().requestPasswordReset(
                    email,
                  );
                }
              },
              child: Text(S.of(context).reset_password),
            ),
          ],
        ),
      ),
    );
  }
}
