import 'package:flutter/material.dart';

class EmptyListLabel extends StatelessWidget {
  /// Creates a label, which warns user, that a list, he's trying to view,
  /// has no elements.
  ///
  /// [elementsAbsenceText] is a message, which will be displayed as label.
  /// [icon] is an icon, which will be displayed above [elementsAbsenceText].
  /// If [icon] is omitted, default icon will be shown.
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
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      );
}
