import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TimeSegmentSelector extends StatelessWidget {
  final int selectedValue;
  final ValueChanged<int> onValueChanged;

  const TimeSegmentSelector({
    super.key,
    required this.selectedValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.sw,
      child: CupertinoSlidingSegmentedControl<int>(
        backgroundColor: Colors.grey.shade100,
        thumbColor: Color(0xff1E1E1E),
        groupValue: selectedValue,
        children: {
          0: _SegmentButton(text: "Today", isSelected: selectedValue == 0),
          1: _SegmentButton(text: "Weekly", isSelected: selectedValue == 1),
          2: _SegmentButton(text: "Overall", isSelected: selectedValue == 2),
        },
        onValueChanged: (value) => onValueChanged(value!),
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const _SegmentButton({required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
