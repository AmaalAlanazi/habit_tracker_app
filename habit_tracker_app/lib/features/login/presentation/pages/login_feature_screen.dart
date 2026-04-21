import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/navigation/routers.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_button.dart';
import 'package:habit_tracker_app/core/widgets/inputs/input_widget.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_text_button.dart';
import 'package:habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:habit_tracker_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:habit_tracker_app/features/login/presentation/cubit/login_state.dart';
import 'package:sizer/sizer.dart';

class LoginFeatureScreen extends HookWidget {
  const LoginFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    final emailController = useTextEditingController(
      text: 'layanalsubie@gmail.com',
    );
    final passwordController = useTextEditingController(text: 'Ll0123456789');
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => LoadingWidget(),
              );
            }

            if (state is LoginSuccessState) {
              context.go(Routes.bottomBar);
            }

            if (state is LoginErrorState) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          width: 100.sw,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Welcome back!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(30),

                              input("Email", controller: emailController),
                              Gap(15),

                              input(
                                "Password",
                                controller: passwordController,
                                isPassword: true,
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    context.push('/forgotPassword');
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ),

                              Gap(15),

                              AuthButton(
                                title: "Log In",
                                onTap: () {
                                  if (!formKey.currentState!.validate()) return;

                                  cubit.login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      Gap(30),

                      AuthTextButton(
                        text: "Don't have an account?",
                        actionText: "Sign Up",
                        route: '/signUp',
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
      ),
    );
  }
}
