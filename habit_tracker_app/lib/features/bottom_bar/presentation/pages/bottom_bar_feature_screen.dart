import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/widgets/add_habit_sheet.dart';
import 'package:habit_tracker_app/features/category/presentation/pages/category_feature_screen.dart';
import 'package:habit_tracker_app/features/home/presentation/pages/home_feature_screen.dart';
import 'package:habit_tracker_app/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:habit_tracker_app/features/statistics/presentation/pages/statistics_feature_screen.dart';

class BottomBarFeatureScreen extends HookWidget {
  const BottomBarFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    final List<Widget> pages = [
      HomeFeatureScreen(),
      StatisticsFeatureScreen(),
      CategoryFeatureScreen(),
      ProfileFeatureScreen(),
    ];

    final List<IconData> iconList = [
      Icons.home_rounded,
      Icons.bar_chart_rounded,
      Icons.grid_view,
      Icons.person_rounded,
    ];

    void showAddHabitSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => const AddHabitSheet(),
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF8F9FA),
      body: pages[selectedIndex.value],
      floatingActionButton: FloatingActionButton(
        onPressed: showAddHabitSheet,
        backgroundColor: const Color(0xff1E1E1E),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 80,
        icons: iconList,
        iconSize: 30,
        activeIndex: selectedIndex.value,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 40,
        rightCornerRadius: 40,
        onTap: (index) => selectedIndex.value = index,
        activeColor: const Color(0xff1E1E1E),
        inactiveColor: Colors.grey.shade400,
        backgroundColor: Colors.white,
      ),
    );
  }
}