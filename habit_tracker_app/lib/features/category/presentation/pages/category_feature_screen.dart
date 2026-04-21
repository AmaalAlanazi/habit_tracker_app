import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_app/core/widgets/loading_widget.dart';
import 'package:habit_tracker_app/features/category/presentation/widgets/add_category_dialog.dart';
import 'package:habit_tracker_app/features/category/presentation/widgets/category_card_item.dart';
import 'package:stacked_cards/stacked_cards.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_state.dart';

class CategoryFeatureScreen extends StatelessWidget {
  const CategoryFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBF5E7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFBF5E7),
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () => _showAddCategoryDialog(context),
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.black87, size: 20),
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 20),
      ),
      body: RefreshIndicator(
        color: Colors.black,
        onRefresh: () async {
          await context.read<CategoryCubit>().loadCategories();
        },
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) return LoadingWidget();
            if (state is CategoryLoaded) {
              final items = state.categories.map((cat) {
                final List habitsList = cat['habits'] is List
                    ? cat['habits']
                    : [];
                return CategoryCard.buildItem(
                  title: cat['title']?.toString() ?? "Untitled",
                  count: '${habitsList.length} Habits',
                  color: _parseColor(cat['color_hex']),
                  iconEmoji: cat['icon_name']?.toString() ?? "💪",
                  habits: cat['habits'] is List ? cat['habits'] : [],
                );
              }).toList();
        
              return items.isEmpty
                  ? Center(child: Text("No Categories yet"))
                  : SizedBox(
                      height: 500,
                      child: StackedCards(items: items.reversed.toList()),
                    );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final cubit = context.read<CategoryCubit>();
    showDialog(
      context: context,
      builder: (ctx) =>
          BlocProvider.value(value: cubit, child: AddCategoryDialog()),
    );
  }

  Color _parseColor(dynamic hex) {
    try {
      String hexStr = hex?.toString() ?? "#FFD3D3D3";
      if (hexStr.startsWith('0x')) hexStr = hexStr.replaceFirst('0x', '#');
      return Color(int.parse(hexStr.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }
}
