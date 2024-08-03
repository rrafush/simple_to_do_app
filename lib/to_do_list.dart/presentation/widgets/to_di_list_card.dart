import 'package:flutter/material.dart';

class ToDoListCard extends StatelessWidget {
  const ToDoListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: colorsTheme.primary,
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: colorsTheme.onPrimary,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: colorsTheme.onPrimary,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: colorsTheme.onPrimary,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
