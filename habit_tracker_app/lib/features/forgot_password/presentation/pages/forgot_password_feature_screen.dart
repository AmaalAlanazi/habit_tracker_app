import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_button.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_text_button.dart';
import 'package:habit_tracker_app/core/widgets/inputs/input_widget.dart';
import 'package:habit_tracker_app/features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:habit_tracker_app/features/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordFeatureScreen extends HookWidget {
  const ForgotPasswordFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    final emailController = useTextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  width: 100.sw,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Enter your email to reset your password",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 13),
                      ),
                      const SizedBox(height: 30),
                      input(
                        "Email",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state is ForgotPasswordLoadingState) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (state is ForgotPasswordSuccessState) {
                          context.pop('/home');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Check your email"),
                              ),
                            );
                          } else if (state is ForgotPasswordErrorState) {
                          context.pop('/forgot-password');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                              ),
                            );
                          }
                        },
                        child: AuthButton(
                          title: "Send Reset Link",
                          onTap: () {
                            if (!formKey.currentState!.validate()) return;

                          cubit.forgotPassword(
                            email: emailController.text.trim(),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AuthTextButton(
                      text: "Remember your password?",
                      actionText: "Log In",
                      route: '/login',
                      actionColor: Colors.black,
                      textColor: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      )
    );
  }
}
