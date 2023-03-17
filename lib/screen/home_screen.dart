import 'package:favorite_calendar/component/main_calendar.dart';
import 'package:favorite_calendar/component/schedule_bottom_sheet.dart';
import 'package:favorite_calendar/component/schedule_card.dart';
import 'package:favorite_calendar/component/today_banner.dart';
import 'package:favorite_calendar/const/colors.dart';
import 'package:favorite_calendar/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime
        .now()
        .year,
    DateTime
        .now()
        .month,
    DateTime
        .now()
        .day,
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
            builder: (_) =>
                ScheduleBottomSheet(
                  selectedDate: selectedDate,
                ),
            isScrollControlled: true,
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
                onDaySelected: onDaySelected, selectedDate: selectedDate),
            SizedBox(
              height: 8.0,
            ),
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                return TodayBanner(selectedDate: selectedDate, count: snapshot.data?.length ?? 0);
              },
            ),

            SizedBox(
              height: 8.0,
            ),
            Expanded(
                child: StreamBuilder<List<Schedule>>(
                  stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (content, index) {
                        final schedule = snapshot.data![index];
                        return Dismissible(
                          key: ObjectKey(schedule.id),
                          direction: DismissDirection.startToEnd,
                          onDismissed: (DismissDirection direction) {
                            GetIt.I<LocalDatabase>().removeSchedule(
                                schedule.id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8.0, left: 8.0, right: 8.0),
                            child: ScheduleCard(
                              startTime: schedule.startTime,
                              endTime: schedule.endTime,
                              content: schedule.content,
                            ),
                          ),
                        );
                      },
                    );
                  },
                )),
            // TodayBanner(selectedDate: selectedDate, count: 0),
            // ScheduleCard(startTime: 12, endTime: 14, content: '프로그래밍공부')
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
