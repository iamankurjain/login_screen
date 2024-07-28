import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onToggle;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final double minHeight;

  const CustomToggleButton({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onToggle,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.borderColor = Colors.blue,
    this.selectedTextColor = Colors.white,
    this.unselectedTextColor = Colors.black,
    required this.minHeight
  });

  @override
  CustomToggleButtonState createState() => CustomToggleButtonState();
}

class CustomToggleButtonState extends State<CustomToggleButton> {
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(widget.labels.length, (index) => index == widget.selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(20),
      selectedBorderColor: widget.borderColor,
      selectedColor: widget.selectedTextColor,
      fillColor: widget.selectedColor,
      color: widget.unselectedTextColor,
      constraints: BoxConstraints(
        minHeight: widget.minHeight,
        minWidth: widget.minHeight,
      ),
      isSelected: isSelected,
      onPressed: (index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
        widget.onToggle(index);
      },
      children: widget.labels.map((label) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(label),
        );
      }).toList(),
    );
  }
}