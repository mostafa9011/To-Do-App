import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/edit_task/pages/edit_task_view.dart';
import 'package:todo_app/app/layout/layout_view.dart';
import 'package:todo_app/app/login/pages/login_view.dart';
import 'package:todo_app/app/register/pages/register_view.dart';
import 'package:todo_app/app/settings/pages/settings_view.dart';
import 'package:todo_app/app/splash/pages/splash_view.dart';
import 'package:todo_app/app/tasks/pages/task_view.dart';
import 'package:todo_app/config/constants/appthem_manager.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CubitSettings(LightState()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = BlocProvider.of<CubitSettings>(context);

    return BlocBuilder<CubitSettings, StatesSettings>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemManager.lightTheme,
        darkTheme: AppThemManager.darkTheme,
        themeMode: vm.currentTheme,
        routes: {
          LoginView.id: (context) => const LoginView(),
          RegisterView.id: (context) => const RegisterView(),
          TaskView.id: (context) => const TaskView(),
          SplashView.id: (context) => const SplashView(),
          EditTaskView.id: (context) => const EditTaskView(),
          SettingsView.id: (context) => const SettingsView(),
          LayoutView.id: (context) => const LayoutView(),
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
