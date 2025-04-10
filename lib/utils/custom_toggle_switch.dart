import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onToggle;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomToggleSwitch({
    super.key,
    required this.icons,
    required this.labels,
    required this.selectedIndex,
    required this.onToggle,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.blue,
    this.activeTextColor = Colors.blue,
    this.inactiveTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: inactiveColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(labels.length, (index) {
          final bool isActive = index == selectedIndex;
          return Flexible(
            child: GestureDetector(
              onTap: () => onToggle(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: isActive ? activeColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icons[index], color: isActive ? activeTextColor : inactiveTextColor),
                    if (labels.length <= 2) ...[
                      const SizedBox(width: 5),
                      Text(
                        labels[index],
                        style: TextStyle(
                          color: isActive ? activeTextColor : inactiveTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
