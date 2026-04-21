import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/auth_card.dart';
import 'package:habit_tracker_app/core/widgets/buttons/auth_button.dart';
import 'package:habit_tracker_app/core/widgets/inputs/input_widget.dart';
import 'package:habit_tracker_app/core/widgets/profile_avatar.dart';
import 'package:habit_tracker_app/core/widgets/show_snack.dart';
import 'package:habit_tracker_app/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:habit_tracker_app/features/edit_profile/presentation/cubit/edit_profile_state.dart';

class EditProfileFeatureScreen extends HookWidget {
  const EditProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();

    final name = useTextEditingController();
    final email = useTextEditingController();

    return Scaffold(
      backgroundColor: ColorsApp.primary,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        backgroundColor: ColorsApp.primary,
      ),
      body: SafeArea(
        child: BlocListener<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileSuccessState) {
              context.pop();
            }
            if (state is EditProfileErrorState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AuthCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileAvatar(),
                    Gap(15),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(25),
                    input("Name", controller: name),
                    Gap(15),
                    input("Email", controller: email),
                    Gap(25),
                    BlocBuilder<EditProfileCubit, EditProfileState>(
                      builder: (context, state) {
                        final isLoading = state is EditProfileLoadingState;

                        return AuthButton(
                          title: "Save Changes",
                          isLoading: isLoading,
                          onTap: () {
                            final newName = name.text.trim();
                            final newEmail = email.text.trim();

                            if (newName.isEmpty && newEmail.isEmpty) {
                              showSnack(context, "Enter at least one field");
                              return;
                            }

                            cubit.updateProfile(
                              name: newName.isNotEmpty ? newName : null,
                              email: newEmail.isNotEmpty ? newEmail : null,
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
