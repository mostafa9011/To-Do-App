import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config/cubits/settings_cubit/settings_cubit.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final EasyInfiniteDateTimelineController controller =
      EasyInfiniteDateTimelineController();
  DateTime focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = BlocProvider.of<CubitSettings>(context);

    return EasyInfiniteDateTimeLine(
      locale: 'en',
      showTimelineHeader: false,
      dayProps: EasyDayProps(
        todayStyle: DayStyle(
          dayNumStyle: const TextStyle(color: Colors.white),
          dayStrStyle: const TextStyle(color: Colors.white),
          monthStrStyle: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.60),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        height: 90,
        inactiveDayStyle: DayStyle(
          dayNumStyle:
              TextStyle(color: vm.isLight() ? Colors.black : Colors.white),
          dayStrStyle: TextStyle(
            color: vm.isLight() ? Colors.grey : Colors.white,
            fontSize: 14,
          ),
          monthStrStyle: TextStyle(
            color: vm.isLight() ? Colors.grey : Colors.white,
            fontSize: 14,
          ),
          decoration: BoxDecoration(
            color: vm.isLight() ? Colors.white : const Color(0XFF141922),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle:
              theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
          dayStrStyle:
              theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
          monthStrStyle:
              theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        separatorPadding: 18,
      ),
      controller: controller,
      firstDate: DateTime(2024),
      focusDate: focusDate,
      lastDate: DateTime(2025),
      onDateChange: (selectedDate) {
        setState(() {
          focusDate = selectedDate;
        });
      },
    );
  }
}
