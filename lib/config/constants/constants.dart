import 'package:flutter/material.dart';
import 'package:todo_app/app/edit_task/pages/edit_task_view.dart';
import 'package:todo_app/app/layout/layout_view.dart';
import 'package:todo_app/app/login/pages/login_view.dart';
import 'package:todo_app/app/register/pages/register_view.dart';
import 'package:todo_app/app/settings/pages/settings_view.dart';
import 'package:todo_app/app/splash/pages/splash_view.dart';
import 'package:todo_app/app/tasks/pages/task_view.dart';

const Color lightScaffoldBgColor = Color(0xffDFECDB);
const Color darkScaffoldBgColor = Color(0xff060E1E);
const Color kPrimaryColor = Color(0XFF5D9CEC);
Map<String, Widget Function(BuildContext)> kScreens = {
  LoginView.id: (context) => const LoginView(),
  RegisterView.id: (context) => const RegisterView(),
  TaskView.id: (context) => const TaskView(),
  SplashView.id: (context) => const SplashView(),
  EditTaskView.id: (context) => const EditTaskView(),
  SettingsView.id: (context) => const SettingsView(),
  LayoutView.id: (context) => const LayoutView(),
};
