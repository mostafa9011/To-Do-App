import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);

    return Container(
      width: mediaQuery.width,
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: vm.isLight() ? Colors.white : const Color(0xFF141922),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 80,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Play Basket Ball",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 20,
                    color: vm.isLight() ? Colors.black : Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "10:30 Am",
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: vm.isLight() ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              debugPrint("do something");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(
                Icons.check_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
