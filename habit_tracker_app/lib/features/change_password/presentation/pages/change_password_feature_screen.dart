import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/auth_card.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_button.dart';
import 'package:habit_tracker_app/core/widgets/show_snack.dart';
import 'package:habit_tracker_app/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:habit_tracker_app/features/change_password/presentation/cubit/change_password_state.dart';
import 'package:habit_tracker_app/features/change_password/presentation/widgets/password_input.dart';

class ChangePasswordFeatureScreen extends HookWidget {
  const ChangePasswordFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPass = useTextEditingController();
    final confirmPass = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorsApp.primary,
      appBar: AppBar(
        title: Text("Change Password"),
        centerTitle: true,
        backgroundColor: ColorsApp.primary,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
            listener: (context, state) {
              if (state is ChangePasswordSuccessState) {
                showSnack(context, "Password updated");
                context.pop();
              }
              if (state is ChangePasswordErrorState) {
                showSnack(context, state.message);
              }
            },
            child: Form(
              key: formKey,
              child: AuthCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.lock_outline, size: 50),
                    Gap(10),
                    Text(
                      "Update Your Password",
                      style: TextStyle(fontSize: 18),
                    ),
                    Gap(25),
                    PasswordInput(
                      label: "New Password",
                      controller: newPass,
                      validator: (v) {
                        if (v == null || v.length < 6) {
                          return "Weak password";
                        }
                        return null;
                      },
                    ),
                    Gap(15),
                    PasswordInput(
                      label: "Confirm Password",
                      controller: confirmPass,
                      validator: (v) {
                        if (v != newPass.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                    ),
                    Gap(25),
                    BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
                      builder: (context, state) {
                        final isLoading = state is ChangePasswordLoading;

                        return AuthButton(
                          title: "Update Password",
                          isLoading: isLoading,
                          onTap: () {
                            if (!formKey.currentState!.validate()) return;

                            context.read<ChangePasswordCubit>().changePassword(
                              newPass.text.trim(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
