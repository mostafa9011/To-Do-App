import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/tasks/models/task_model.dart';
import 'package:todo_app/app/tasks/widgets/task_item.dart';
import 'package:todo_app/config/constants/constants.dart';

class StreamTasks extends StatefulWidget {
  const StreamTasks({super.key});

  @override
  State<StreamTasks> createState() => _StreamTasksState();
}

class _StreamTasksState extends State<StreamTasks> {
  Stream<QuerySnapshot> taskStream = FirebaseFirestore.instance
      .collection('Tasks')
      .orderBy('time')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: taskStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        } else {
          List<TaskModel> tasksList = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            tasksList.add(
              TaskModel.fromJson(
                snapshot.data!.docs[i],
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: tasksList.length,
              itemBuilder: (context, index) => TaskItem(
                task: tasksList[index],
              ),
            ),
          );
        }
      },
    );
  }
}
