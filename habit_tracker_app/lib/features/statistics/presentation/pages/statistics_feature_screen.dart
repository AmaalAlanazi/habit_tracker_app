import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/insight_warning_banner.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/overall_statistics_content.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/score_circular_chart.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/summary_bar_chart.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/time_segment_selector.dart';
import 'package:habit_tracker_app/features/statistics/presentation/widgets/weekly_habit_content.dart';

class StatisticsFeatureScreen extends HookWidget {
  const StatisticsFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);

    return Scaffold(
      backgroundColor: Color(0xFFFBF5E7),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xFFFBF5E7),
        title: Text(
          "Statistics",
          style: TextStyle(fontSize: 28, fontWeight: .bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Gap(10),
            TimeSegmentSelector(
              selectedValue: selectedTab.value,
              onValueChanged: (index) => selectedTab.value = index,
            ),
            Gap(30),

            if (selectedTab.value == 0)
              Column(
                children: [
                  ScoreCircularChart(score: '4'),
                  Gap(20),
                  InsightWarningBanner(),
                  Gap(20),
                  SummaryBarChart(),
                  Gap(150),
                ],
              )
            else if (selectedTab.value == 1)
              WeeklyHabitContent()
            else
              OverallStatisticsContent(),
          ],
        ),
      ),
    );
  }
}