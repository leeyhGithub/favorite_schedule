import 'package:favorite_calendar/component/main_calendar.dart';
import 'package:favorite_calendar/component/schedule_bottom_sheet.dart';
import 'package:favorite_calendar/component/schedule_card.dart';
import 'package:favorite_calendar/component/today_banner.dart';
import 'package:favorite_calendar/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: true,
              builder: (_) => ScheduleBottomSheet(),
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
                onDaySelected: onDaySelected, selectedDate: selectedDate),
            SizedBox(
              height: 8.0,
            ),
            TodayBanner(selectedDate: selectedDate, count: 0),
            ScheduleCard(startTime: 12, endTime: 14, content: '프로그래밍공부')
            // MainCalendar()
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
