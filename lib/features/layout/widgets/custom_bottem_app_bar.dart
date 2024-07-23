import 'package:flutter/material.dart';

class CustomBottemAppBar extends StatelessWidget {
  const CustomBottemAppBar({super.key, this.onTap, required this.currentIndex});
  final int currentIndex;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      shape: const CircularNotchedRectangle(),
      child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: onTap
          // (value) {
          //   setState(() {
          //     currentIndex = value;
          //   });
          // },
          ),
    );
  }
}
