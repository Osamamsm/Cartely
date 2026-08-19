import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/helpers/validators.dart';
import 'package:e_commerce/core/widgets/custom_labeled_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/logic/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/email_text_field.dart';
import 'package:e_commerce/features/auth/presentation/widgets/password_text_field.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  late String name, email, password, confirmPassword, phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: 12,
          left: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              vGap(30),
              LabeledAuthTextField(
                validator: Validators.fullNameValidator,
                label: S.of(context).full_name,
                hintText: S.of(context).full_name_hint,
                onSaved: (value) {
                  name = value!;
                },
              ),
              vGap(20),
              EmailTextField(
                onSaved: (value) {
                  email = value!;
                },
              ),
              vGap(20),
              CustomLabeledTextFormField(
                label: S.of(context).phone_number,
                suffixIcon: Icons.phone,
                validator: Validators.phoneNumberValidator,
                onSaved: (value) {
                  phoneNumber = value!;
                },
                keyboardType: TextInputType.phone,
                obscureText: false,
              ),
              vGap(20),
              PasswordTextField(
                passwordController: passwordController,
                validator: Validators.passwordValidator,
                hintText: S.of(context).password_hint,
                label: S.of(context).password,
                onSaved: (value) {
                  password = value!;
                },
              ),
              vGap(20),
              PasswordTextField(
                label: S.of(context).confirm_password,
                hintText: S.of(context).confirm_password_hint,
                onSaved: (value) {
                  confirmPassword = value!;
                },
                validator: (value) {
                  return Validators.confirmPasswordValidator(
                    value,
                    passwordController.text,
                  );
                },
              ),
              vGap(20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    context.read<SignUpCubit>().signUp(
                      email,
                      password,
                      name,
                      phoneNumber,
                    );
                  }
                },
                child: Text(S.of(context).register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
