import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/cubit/bottom_bar_cubit.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/pages/bottom_bar_feature_screen.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/features/login/presentation/pages/login_feature_screen.dart';
import 'package:habit_tracker_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:habit_tracker_app/features/sign_up/presentation/pages/sign_up_feature_screen.dart';
import 'package:habit_tracker_app/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:habit_tracker_app/features/home/presentation/pages/home_feature_screen.dart';
import 'package:habit_tracker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:habit_tracker_app/features/category/presentation/pages/category_feature_screen.dart';
import 'package:habit_tracker_app/features/category/presentation/cubit/category_cubit.dart';
import 'package:habit_tracker_app/features/statistics/presentation/pages/statistics_feature_screen.dart';
import 'package:habit_tracker_app/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:habit_tracker_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:habit_tracker_app/features/forgot_password/presentation/pages/forgot_password_feature_screen.dart';
import 'package:habit_tracker_app/features/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:habit_tracker_app/features/welcome/presentation/pages/welcome_feature_screen.dart';
import 'package:habit_tracker_app/features/change_password/presentation/pages/change_password_feature_screen.dart';
import 'package:habit_tracker_app/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:habit_tracker_app/features/edit_profile/presentation/pages/edit_profile_feature_screen.dart';
import 'package:habit_tracker_app/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.welcome,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.category,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoryCubit(GetIt.I.get()),
          child: const CategoryFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.statistics,
        builder: (context, state) => StatisticsFeatureScreen(),
      ),

      GoRoute(
        path: Routes.profile,
        builder: (context, state) => BlocProvider(
          create: (_) => GetIt.I<ProfileCubit>()..loadProfile(),
          child: const ProfileFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgotPasswordCubit(GetIt.I.get()),
          child: const ForgotPasswordFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => WelcomeFeatureScreen(),
      ),

      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(GetIt.I.get()),
          child: const ChangePasswordFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(GetIt.I.get()),
          child: const EditProfileFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.bottomBar,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  BottomBarCubit(GetIt.I.get())..getCategories(),
            ),
            BlocProvider(
              create: (context) => HomeCubit(GetIt.I.get())..getTodayHabits(),
            ),
            BlocProvider(
              create: (context) =>
                  CategoryCubit(GetIt.I.get())..loadCategories(),
            ),
            BlocProvider(create: (context) => ProfileCubit(GetIt.I.get())),
          ],
          child: const BottomBarFeatureScreen(),
        ),
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
