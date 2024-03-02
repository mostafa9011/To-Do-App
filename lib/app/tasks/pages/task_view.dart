import 'package:flutter/material.dart';
import 'package:todo_app/app/tasks/widgets/custom_app_bar_title.dart';
import 'package:todo_app/app/tasks/widgets/custom_calendar.dart';
import 'package:todo_app/app/tasks/widgets/task_item.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});
  static const String id = 'TaskView';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment(0, 1.7),
              children: [
                CustomAppBarTitle(
                  title: 'To Do List',
                ),
                CustomCalendar(),
              ],
            ),
          ],
        ),
        const SizedBox(height: 50),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (context, index) => const TaskItem(),
          ),
        ),
      ],
    );
  }
}
