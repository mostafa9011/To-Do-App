import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config/constants/constants.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';
import 'package:todo_app/config/widgets/custom_text_field.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({super.key});

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  String? title, content, date;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);
    return Container(
      // color: vm.isLight() ? Colors.white : const Color(0xff141922),

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
                'Add A New Task',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: vm.isLight() ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomTextFormField(
                onSaved: (value) {
                  title = value;
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
                onSaved: (value) {
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    fixedSize: Size(mediaQuery.size.width * 0.8, 20)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    debugPrint('done...');
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
