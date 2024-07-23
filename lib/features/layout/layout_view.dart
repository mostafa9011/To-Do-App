import 'package:flutter/material.dart';
import '../settings/pages/settings_view.dart';
import '../tasks/pages/task_view.dart';
import 'widgets/custom_bottem_app_bar.dart';
import 'widgets/custom_floating_action_button.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const String id = 'LayoutView';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = const [
    TaskView(),
    SettingsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottemAppBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[currentIndex],
    );
  }
}
