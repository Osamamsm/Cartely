import 'package:e_commerce/core/helpers/constants.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/features/auth/presentation/logic/log_in_cubit/log_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/forgot_password_view.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/features/auth/presentation/widgets/email_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();

  late String email, password;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Padding(
      padding: Constants.kHorizontalPaddingMedium,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(s.login_welcome_message, style: theme.textTheme.titleLarge),
              Text(s.login_welcome_subtitle, style: theme.textTheme.bodyMedium),
              vGap(40),
              EmailTextField(
                onSaved: (value) {
                  email = value!;
                },
              ),
              vGap(20),
              PasswordTextField(
                validator: Validators.passwordValidator,
                hintText: s.password_hint,
                label: s.password,
                onSaved: (value) {
                  password = value!;
                },
              ),
              vGap(10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push(ForgotPasswordView.routeName);
                  },
                  child: Text(s.forgot_password),
                ),
              ),
              vGap(10),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<LogInCubit>().logIn(email, password);
                  }
                },
                child: Text(s.login),
              ),
              vGap(20),
              Row(
                mainAxisSize: .min,
                children: [
                  Text(s.no_account, style: theme.textTheme.bodyMedium),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(RegisterView.routeName);
                    },
                    child: Text(s.register),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
