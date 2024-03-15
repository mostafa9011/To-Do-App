import 'package:flutter/material.dart';
import 'package:todo_app/app/tasks/widgets/custom_app_bar_title.dart';
import 'package:todo_app/app/tasks/widgets/custom_calendar.dart';
import 'package:todo_app/app/tasks/widgets/stream_tasks.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});
  static const String id = 'TaskView';

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Column(
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
        SizedBox(height: 50),
        StreamTasks(),
      ],
    );
  }
}
