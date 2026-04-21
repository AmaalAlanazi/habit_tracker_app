import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/navigation/routers.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/utils/validators.dart';
import 'package:habit_tracker_app/core/widgets/auth_card.dart';
import 'package:habit_tracker_app/core/widgets/auth_header.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_button.dart';
import 'package:habit_tracker_app/core/widgets/inputs/input_widget.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_text_button.dart';
import 'package:habit_tracker_app/core/widgets/show_snack.dart';
import 'package:habit_tracker_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:habit_tracker_app/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpFeatureScreen extends HookWidget {
  const SignUpFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();

    final name = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            context.go(Routes.bottomBar);
          }

          if (state is SignUpErrorState) {
            showSnack(context, state.message);
          }
        },
        builder: (context, state) {
          final isLoading = state is SignUpLoadingState;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(30),
                    Column(
                      children: [
                        AuthCard(
                          child: Column(
                            children: [
                              const AuthHeader(
                                title: "Create an account",
                                subtitle: "Start building better habits today",
                              ),

                              Gap(10),

                              input(
                                "Name",
                                controller: name,
                                validator: Validators.validateFullName,
                              ),

                              Gap(10),

                              input(
                                "Email",
                                controller: email,
                                validator: Validators.validateEmail,
                              ),

                              Gap(20),

                              input(
                                "Password",
                                controller: password,
                                validator: Validators.validatePassword,
                              ),

                              const Gap(20),

                              AuthButton(
                                title: "Sign Up",
                                isLoading: isLoading,
                                onTap: () {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }

                                  cubit.signUp(
                                    email: email.text.trim(),
                                    password: password.text.trim(),
                                    name: name.text.trim(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        Gap(30),

                        AuthTextButton(
                          text: "Already have an account?",
                          actionText: "Log In",
                          route: '/login',
                          actionColor: Colors.black,
                          textColor: Colors.black54,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
