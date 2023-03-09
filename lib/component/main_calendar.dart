import 'package:favorite_calendar/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  MainCalendar(
      {Key? key, required this.onDaySelected, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      focusedDay: DateTime.now(),
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          )),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0), color: LIGHT_GREY_COLOR),
        weekendDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0), color: LIGHT_GREY_COLOR),
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: PRIMARY_COLOR, width: 1.0),
        ),
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        weekendTextStyle:
            TextStyle(fontWeight: FontWeight.w600, color: DARK_GREY_COLOR),
        selectedTextStyle:
            TextStyle(fontWeight: FontWeight.w600, color: DARK_GREY_COLOR),
      ),
    );
  }
}

// * MainCalendar 내부 변수로 추가해서 사용해도 같이 동작함 - 테스트 코드
// class MainCalendar extends StatefulWidget {
//   MainCalendar({Key? key}) : super(key: key);
//
//   @override
//   State<MainCalendar> createState() => _MainCalendarState();
// }
//
// class _MainCalendarState extends State<MainCalendar> {
//   DateTime selectedDate = DateTime.now();
//
//   void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
//     setState(() {
//       this.selectedDate = selectedDate;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       // onDaySelected: onDaySelected,
//       onDaySelected: (DateTime selectedDate, DateTime focusedDate) {
//         print(selectedDate.year);
//         print(selectedDate.month);
//         print(selectedDate.day);
//         setState(() {
//           this.selectedDate = selectedDate;
//         });
//       },
//       selectedDayPredicate: (date) =>
//       date.year == selectedDate.year &&
//           date.month == selectedDate.month &&
//           date.day == selectedDate.day,
//       focusedDay: DateTime.now(),
//       firstDay: DateTime(1800, 1, 1),
//       lastDay: DateTime(3000, 1, 1),
//       headerStyle: HeaderStyle(
//           titleCentered: true,
//           formatButtonVisible: false,
//           titleTextStyle: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 16.0,
//           )),
//       calendarStyle: CalendarStyle(
//         isTodayHighlighted: false,
//         defaultDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0), color: LIGHT_GREY_COLOR),
//         weekendDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(6.0), color: LIGHT_GREY_COLOR),
//         selectedDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6.0),
//           border: Border.all(color: PRIMARY_COLOR, width: 1.0),
//         ),
//         defaultTextStyle: TextStyle(
//           fontWeight: FontWeight.w600,
//           color: DARK_GREY_COLOR,
//         ),
//         weekendTextStyle:
//         TextStyle(fontWeight: FontWeight.w600, color: DARK_GREY_COLOR),
//         selectedTextStyle:
//         TextStyle(fontWeight: FontWeight.w600, color: DARK_GREY_COLOR),
//       ),
//     );
//   }
// }


