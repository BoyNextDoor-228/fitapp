import 'package:flutter/material.dart';

class EmptyListLabel extends StatelessWidget {
  const EmptyListLabel({
    required this.elementsAbsenceText,
    this.icon,
    super.key,
  });

  final Icon? icon;
  final String elementsAbsenceText;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          icon ??
              const Icon(
                Icons.priority_high,
                size: 100,
              ),
          Text(
            elementsAbsenceText,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
