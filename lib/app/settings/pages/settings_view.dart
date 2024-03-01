import 'dart:developer';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/tasks/widgets/custom_app_bar_title.dart';
import 'package:todo_app/config/constants/constants.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_state.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const String id = 'SettingsView';

  @override
  Widget build(BuildContext context) {
    List<String> languageList = const [
      "English",
      "عربي",
    ];
    List<String> themeList = const [
      'Light',
      'Dark',
    ];

    var vm = BlocProvider.of<CubitSettings>(context);
    // var local = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return BlocConsumer<CubitSettings, StatesSettings>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const CustomAppBarTitle(title: 'Settings',),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Language',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: vm.isLight() ? Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      decoration: CustomDropdownDecoration(
                        closedFillColor: kPrimaryColor,
                        expandedFillColor: kPrimaryColor,
                        closedSuffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: vm.isLight() ? Colors.black : Colors.white,
                        ),
                        expandedSuffixIcon: Icon(
                          Icons.keyboard_arrow_up,
                          color: vm.isLight() ? Colors.black : Colors.white,
                        ),
                      ),
                      hintText: 'Select Language',
                      items: languageList,
                      onChanged: (value) {
                        // if (value == languageList[0]) {
                        //   BlocProvider.of<CubitApp>(context).swapToEnglish();
                        // } else {
                        //   BlocProvider.of<CubitApp>(context).swapToArabic();
                        // }
                        // log(value);
                      },
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Select Theme ',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: vm.isLight() ? Colors.black : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      decoration: CustomDropdownDecoration(
                        closedFillColor: kPrimaryColor,
                        expandedFillColor: kPrimaryColor,
                        closedSuffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: vm.isLight() ? Colors.black : Colors.white,
                        ),
                        expandedSuffixIcon: Icon(
                          Icons.keyboard_arrow_up,
                          color: vm.isLight() ? Colors.black : Colors.white,
                        ),
                      ),
                      hintText: 'Select Theme ',
                      items: themeList,
                      onChanged: (value) {
                        if (value == themeList[0]) {
                          BlocProvider.of<CubitSettings>(context)
                              .swapToLightTheme();
                        } else {
                          BlocProvider.of<CubitSettings>(context)
                              .swapToDarkTheme();
                        }
                        log(value);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
