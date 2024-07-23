import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/constants/appthem_manager.dart';
import 'core/constants/constants.dart';
import 'features/settings/manager/settings_cubit.dart';
import 'features/settings/manager/settings_state.dart';
import 'features/splash/pages/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        builder: EasyLoading.init(
          builder: BotToastInit(),
        ),
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
