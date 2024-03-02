import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:todo_app/config/constants/constants.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';
import 'package:todo_app/config/widgets/custom_text_field.dart';

import '../../../config/services/snake_bar_services.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key, required this.title, required this.buttonName});
  final String title;
  final String buttonName;

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  String? task, content, date;
  CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);
    return Container(
      padding: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: vm.isLight() ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFormField(
                onChanged: (value) {
                  task = value;
                },
                onValidate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Feild Required !';
                  } else {
                    return null;
                  }
                },
                hint: 'Enter your task.',
                hintColor: Colors.grey,
              ),
              CustomTextFormField(
                onChanged: (value) {
                  content = value;
                },
                onValidate: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Feild Required !';
                  } else {
                    return null;
                  }
                },
                hint: 'Enter content',
                hintColor: Colors.grey,
                maxLines: 3,
                maxLength: 150,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Select Time',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: vm.isLight() ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                '10:00 pm',
                style: theme.textTheme.bodySmall!.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      fixedSize: Size(mediaQuery.size.width * 0.8, 20)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      addTask().then(
                        (value) {
                          Navigator.pop(context);
                          SnackBarService.showSuccessMessage(
                              msg: 'Added Succsess',
                              color: theme.scaffoldBackgroundColor);
                        },
                      );
                    }
                  },
                  child: Text(
                    widget.buttonName, // Add
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTask() async {
    EasyLoading.show();
    try {
      await tasks.add(
        {
          'title': task,
          'content': content,
          'time': DateTime.now(),
        },
      );
      EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
      BotToast.showSimpleNotification(title: 'Feild');
      SnackBarService.showErrorMessage('Feild!');
      log("Failed to add user: ${e.toString()}");
    }
  }
}
