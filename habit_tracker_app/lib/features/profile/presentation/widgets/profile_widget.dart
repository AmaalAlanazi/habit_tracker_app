import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/auth_card.dart';
import 'package:habit_tracker_app/core/widgets/auth_header.dart';
import 'package:habit_tracker_app/core/widgets/profile_avatar.dart';
import 'package:habit_tracker_app/features/profile/presentation/widgets/profile_action_widget.dart';
import 'package:habit_tracker_app/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
final  String name;
 final String email;
  const ProfileWidget({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      children: [
        Stack(
          clipBehavior: .none,
          children: [
            Container(
              height: 25.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ColorsApp.secondary, ColorsApp.primary],
                  begin: .topLeft,
                  end: .bottomRight,
                ),
              ),
            ),

            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: Center(child: ProfileAvatar()),
            ),
          ],
        ),

        Gap(30),

        AuthHeader(title: name, subtitle: "Manage your account info"),

        Gap(20),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: AuthCard(
            child: Column(
              children: [
                ProfileItemWidget(
                  icon: Icons.person_outline,
                  title: "Name",
                  value: name,
                ),
                Gap(15),
                ProfileItemWidget(
                  icon: Icons.email_outlined,
                  title: "Email",
                  value: email,
                ),
                Gap(20),
                Divider(),
                Gap(10),

                ProfileActionWidget(
                  icon: Icons.edit,
                  title: "Edit Profile",
                  onTap: () => context.push('/editProfile'),
                ),

                ProfileActionWidget(
                  icon: Icons.lock_outline,
                  title: "Change Password",
                  onTap: () => context.push('/changePassword'),
                ),

                Divider(),

                ProfileActionWidget(
                  icon: Icons.logout,
                  title: "Log Out",
                  color: Colors.red,
                  onTap: () => context.go('/welcome'),
                ),
              ],
            ),
          ),
        ),

        Gap(40),
      ],
    ),
  );
  }
}