import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker_app/core/theme/color_app.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/cubit/bottom_bar_cubit.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/cubit/bottom_bar_state.dart';
import 'package:habit_tracker_app/features/bottom_bar/presentation/widgets/sheet_option.dart';
import 'package:sizer/sizer.dart';

class AddHabitSheet extends HookWidget {
  const AddHabitSheet({super.key});

  String _formatTimeForDatabase(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute:00';
  }

  @override
  Widget build(BuildContext context) {
    final habitName = useState('Drink water');
    final categoryTitle = useState('Select Category');
    final categoryId = useState<String?>(null);
    final frequency = useState('Everyday');
    final reminderTime = useState('08:00:00');
    final reminderLabel = useState('08:00 AM');

    void showEditNameDialog() {
      final controller = TextEditingController(text: habitName.value);

      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Habit Name'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'E.g. Yoga, Reading...',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  habitName.value = controller.text.trim();
                }
                Navigator.pop(dialogContext);
              },
              child: Text('Save'),
            ),
          ],
        ),
      );
    }

    void showCategoryDialog(List<Map<String, dynamic>> categories) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Select Category'),
          content: SizedBox(
            width: double.maxFinite,
            child: categories.isEmpty
                ? Center(
                    child: Text('No categories found'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final item = categories[index];
                      final title = item['title'] ?? '';
                      final id = item['id'] ?? '';

                      return ListTile(
                        title: Text(title),
                        trailing: categoryId.value == id
                            ? Icon(
                                Icons.check_circle,
                                color: ColorsApp.accent,
                              )
                            : null,
                        onTap: () {
                          categoryTitle.value = title;
                          categoryId.value = id;
                          Navigator.pop(dialogContext);
                        },
                      );
                    },
                  ),
          ),
        ),
      );
    }

    void showFrequencyDialog() {
      final options = ['Everyday', '5 days per week', 'Weekends', 'Custom'];

      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text('Frequency'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map(
                  (opt) => ListTile(
                    title: Text(opt),
                    onTap: () {
                      frequency.value = opt;
                      Navigator.pop(dialogContext);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    return BlocProvider(
      create: (context) => BottomBarCubit(GetIt.I.get())..getCategories(),
      child: BlocConsumer<BottomBarCubit, BottomBarState>(
        listener: (context, state) {
          if (state is BottomBarSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Habit added successfully'),
              ),
            );
            Navigator.pop(context);
          }

          if (state is BottomBarErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<BottomBarCubit>();
          final isLoading = state is BottomBarLoadingState;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0xFFA5B68D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(10),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Gap(25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create New Habit',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(20),
                SheetOption(
                  icon: Icons.edit_calendar,
                  title: 'Habit Name',
                  trailing: habitName.value,
                  onTap: showEditNameDialog,
                ),
                Gap(12),
                SheetOption(
                  icon: Icons.category_outlined,
                  title: 'Category',
                  trailing: categoryTitle.value,
                  onTap: () => showCategoryDialog(cubit.categoriesList),
                ),
                Gap(12),
                SheetOption(
                  icon: Icons.repeat_rounded,
                  title: 'Frequency',
                  trailing: frequency.value,
                  onTap: showFrequencyDialog,
                ),
                Gap(12),
                SheetOption(
                  icon: Icons.notifications_active_outlined,
                  title: 'Reminder',
                  trailing: reminderLabel.value,
                  onTap: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (picked != null) {
                      reminderLabel.value = picked.format(context);
                      reminderTime.value = _formatTimeForDatabase(picked);
                    }
                  },
                ),
                Gap(30),
                SizedBox(
                  width: 100.sw,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (habitName.value.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please enter habit name'),
                                ),
                              );
                              return;
                            }

                            if (categoryId.value == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please select a category'),
                                ),
                              );
                              return;
                            }

                            await context.read<BottomBarCubit>().addNewHabit(
                                  title: habitName.value.trim(),
                                  cId: categoryId.value!,
                                  time: reminderTime.value,
                                );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: isLoading
                        ? SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            'Add Habit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                ),
                Gap(40),
              ],
            ),
          );
        },
      ),
    );
  }
}