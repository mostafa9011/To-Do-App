import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app/edit_tasks/pages/edit_task_view.dart';
import 'package:todo_app/app/tasks/models/task_model.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';
import 'package:todo_app/config/services/snake_bar_services.dart';

import '../../../config/services/firebase_utils.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    // CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditTaskView.id, arguments: task);
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
                  EasyLoading.show();
                  FirestoreManager().deleteTask(task.id!).then(
                    (value) {
                      EasyLoading.dismiss();
                      SnackBarService.showSuccessMessage('Deleted Successful ');
                      log("Task Deleted");
                    },
                  ).catchError(
                    (error) {
                      EasyLoading.dismiss();
                      log("Failed to delete Task: $error");
                    },
                  );
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
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        task.title,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.primaryColor,
                        ),
                      ),
                      Text(
                        task.content,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
                            '${task.time.year}-${task.time.month}-${task.time.day}',
                            // extractTime(task.time).toString(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: vm.isLight() ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
