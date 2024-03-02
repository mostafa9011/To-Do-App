import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Container(
      height: mediaQuery.size.height * 0.22,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(
        color: theme.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 60, left: 50),
        child: Text(
          title,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
