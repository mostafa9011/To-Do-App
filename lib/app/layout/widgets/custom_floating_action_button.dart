import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/layout/widgets/modal_sheet.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var vm = BlocProvider.of<CubitSettings>(context);
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor:
              vm.isLight() ? Colors.white : const Color(0xff141922),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          context: context,
          builder: (context) {
            return const ModalSheet(
              title: 'Add A New Task',
              buttonName: 'Add',
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
