import 'package:flutter/material.dart';
import 'package:todo_app/app/layout/widgets/custom_bottem_app_bar.dart';
import 'package:todo_app/app/settings/pages/settings_view.dart';
import 'package:todo_app/app/tasks/pages/task_view.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[currentIndex],
    );
  }
}
