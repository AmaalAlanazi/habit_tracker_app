import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:habit_tracker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:habit_tracker_app/features/home/presentation/cubit/home_state.dart';
import 'package:habit_tracker_app/features/home/presentation/widgets/habit_task_card.dart';
import 'package:habit_tracker_app/features/home/presentation/widgets/pie_chart_widget.dart';
import 'package:habit_tracker_app/features/home/presentation/widgets/time_line_calendar.dart';

class HomeFeatureScreen extends StatelessWidget {
  const HomeFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, toolbarHeight: 10,),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            LoadingWidget();
          }
          if (state is HomeErrorState) {
            return Center(child: Text(state.errorMessage));
          }
          if (state is HomeSuccessState) {
            final habits = state.habits;
            final completedCount = habits.where((h) => h.isCompletedToday).length;

            return RefreshIndicator(
              onRefresh: () => context.read<HomeCubit>().getTodayHabits(),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    TimelineCalendar(),
                    Gap(20),
                    HabitCircleProgress(
                      progress: completedCount,
                      total: habits.length,
                      habitIcons: habits.map((h) => h.iconName).toList(),
                    ),
                    Gap(30),
                    HabitStackedSection(habits: habits),
                    Gap(80), 
                  ],
                ),
              ),
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}