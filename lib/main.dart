import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/splash/pages/splash_view.dart';
import 'package:todo_app/config/constants/appthem_manager.dart';
import 'package:todo_app/config/constants/constants.dart';
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
        routes: kScreens,
        initialRoute: SplashView.id,
      ),
    );
  }
}
