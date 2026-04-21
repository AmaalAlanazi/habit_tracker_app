import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker_app/core/services/user_service.dart';
import 'package:habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:habit_tracker_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:habit_tracker_app/features/profile/presentation/widgets/profile_widget.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();

    final userService = GetIt.I<UserService>();
    final cachedUser = userService.users;

    if (cachedUser == null) {
      cubit.loadProfile();
    }

    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (cachedUser != null) {
            return ProfileWidget(name: cachedUser.name, email: cachedUser.email);
          }

          if (state is ProfileLoadingState) {
            return LoadingWidget();
          }

          if (state is ProfileErrorState) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.white)),
            );
          }

          if (state is ProfileSuccessState) {
            final user = state.profile;
            return ProfileWidget(name: user.name, email: user.email);
          }

          return SizedBox();
        },
      ),
    );
  }
}
