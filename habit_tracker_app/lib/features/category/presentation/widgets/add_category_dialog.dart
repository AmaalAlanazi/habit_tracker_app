import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; //
import 'package:gap/gap.dart';
import '../cubit/category_cubit.dart';

class AddCategoryDialog extends HookWidget {
  const AddCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController();
    final selectedCardColor = useState("#FFE0B2");
    final selectedEmoji = useState("💪");

    final List<String> colors = [
      "#FFE0B2",
      "#C8E6C9",
      "#B3E5FC",
      "#F8BBD0",
      "#E1BEE7",
    ];
    final List<String> emojis = ["💪", "📚", "🧘", "🍎", "⏰", "🎨"];

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text("New Category"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Category Title"),
            ),
            Gap(20),
            Text(
              "Select Color:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: colors
                  .map(
                    (hex) => ColorOption(
                      hex: hex,
                      selectedCardColor: selectedCardColor,
                    ),
                  )
                  .toList(),
            ),
            Gap(20),
            Text(
              "Select Icon:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gap(10),
            Wrap(
              spacing: 10,
              children: emojis
                  .map(
                    (emoji) =>
                        EmojiOption(emoji: emoji, selectedEmoji: selectedEmoji),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty) {
              context.read<CategoryCubit>().addNewCategory(
                titleController.text,
                selectedCardColor.value,
                selectedEmoji.value,
              );
              Navigator.pop(context);
            }
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}

class ColorOption extends StatelessWidget {
  final String hex;
  final ValueNotifier<String> selectedCardColor;
  const ColorOption({
    super.key,
    required this.hex,
    required this.selectedCardColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = hex == selectedCardColor.value;
    return GestureDetector(
      onTap: () => selectedCardColor.value = hex,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Color(int.parse(hex.replaceFirst('#', '0xFF'))),
          shape: BoxShape.circle,
          border: isSelected ? Border.all(width: 2, color: Colors.black) : null,
        ),
      ),
    );
  }
}

class EmojiOption extends StatelessWidget {
  final String emoji;
  final ValueNotifier<String> selectedEmoji;
  const EmojiOption({
    super.key,
    required this.emoji,
    required this.selectedEmoji,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = emoji == selectedEmoji.value;
    return GestureDetector(
      onTap: () => selectedEmoji.value = emoji,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black12 : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.black26) : null,
        ),
        child: Text(emoji, style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
