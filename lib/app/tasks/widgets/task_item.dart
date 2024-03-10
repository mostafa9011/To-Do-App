import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app/edit_tasks/pages/edit_task_view.dart';
import 'package:todo_app/app/tasks/models/task_model.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditTaskView.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Slidable(
          key: const ValueKey(0),
          startActionPane: ActionPane(
            //dragDismissible: false,
            extentRatio: 0.3,
            motion: const ScrollMotion(),
            //dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (context) {
                  tasks
                      .doc()
                      .delete()
                      .then((value) => debugPrint("User Deleted"))
                      .catchError((error) =>
                          debugPrint("Failed to delete user: $error"));
                },
                backgroundColor: const Color(0xFFFE4A49),
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ],
          ),
          child: Container(
            width: mediaQuery.width,
            height: 115,
            decoration: BoxDecoration(
              color: vm.isLight() ? Colors.white : const Color(0xFF141922),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      task.title,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          size: 20,
                          color: vm.isLight() ? Colors.black : Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "10:30 Am",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: vm.isLight() ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    debugPrint("do something");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 2,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
