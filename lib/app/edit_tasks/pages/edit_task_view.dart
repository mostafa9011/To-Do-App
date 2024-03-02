import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/layout/widgets/modal_sheet.dart';
import 'package:todo_app/app/tasks/widgets/custom_app_bar_title.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});
  static const String id = 'EditTask';

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);

    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBarTitle(
            title: 'To Do List',
          ),
          Center(
            child: Container(
              height: mediaQuery.size.height * 0.7,
              width: mediaQuery.size.width * 0.8,
              decoration: BoxDecoration(
                color: vm.isLight() ? Colors.white : const Color(0xff141922),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const ModalSheet(
                title: 'Edit Task',
                buttonName: 'Save Edit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
