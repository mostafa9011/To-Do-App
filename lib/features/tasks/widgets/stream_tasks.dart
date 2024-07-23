import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/constants.dart';
import '../../settings/manager/settings_cubit.dart';
import '../../settings/manager/settings_state.dart';
import '../../../core/services/firebase_utils.dart';
import '../models/task_model.dart';
import 'task_item.dart';

class StreamTasks extends StatefulWidget {
  const StreamTasks({super.key});

  @override
  State<StreamTasks> createState() => _StreamTasksState();
}

class _StreamTasksState extends State<StreamTasks> {
  // Stream<QuerySnapshot> taskStream = FirebaseFirestore.instance
  @override
  Widget build(BuildContext context) {
    var vm = BlocProvider.of<CubitSettings>(context);
    return BlocConsumer<CubitSettings, StatesSettings>(
      listener: (context, state) {
        if (state is UpdateDateState) {
          log('Updated!');
        }
      },
      builder: (context, state) {
        return StreamBuilder<QuerySnapshot<TaskModel>>(
          stream: FirestoreManager().getData(vm.selectedDate),
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
              List<TaskModel> tasksList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              // for (var i = 0; i < snapshot.data!.docs.length; i++) {
              //   tasksList.add(
              //     TaskModel.fromJson(
              //       snapshot.data!.docs[i],
              //     ),
              //   );
              // }
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
      },
    );
  }
}
