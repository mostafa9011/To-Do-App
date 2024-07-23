import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../settings/manager/settings_cubit.dart';
import 'modal_sheet.dart';

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
