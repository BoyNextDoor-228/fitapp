import 'package:flutter/material.dart';

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    required this.description,
    required this.handler,
    this.descriptionFlex = 2,
    this.handlerFlex = 1,
    super.key,
  });

  final String description;
  final Widget handler;
  final int descriptionFlex;
  final int handlerFlex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).longestSide;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: height * 0.15,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: descriptionFlex,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    description,
                    style: textTheme.bodyLarge,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: handlerFlex,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: handler,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
