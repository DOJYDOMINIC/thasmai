// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class CalendarScreen extends StatefulWidget {
//   @override
//   _CalendarScreenState createState() => _CalendarScreenState();
// }
//
// class _CalendarScreenState extends State<CalendarScreen> {
//   late CalendarController _calendarController;
//
//   // Map to store whether each day is true or false
//   Map<DateTime, bool> _events = {
//     DateTime(2023, 1, 1): true,
//     DateTime(2023, 1, 5): false,
//     DateTime(2023, 1, 10): true,
//     // Add more dates as needed
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _calendarController = CalendarController();
//   }
//
//   @override
//   void dispose() {
//     _calendarController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar(
//           firstDay: DateTime.now(),
//           focusedDay: DateTime.now(),
//           lastDay: DateTime.now(),
//           calendarController: _calendarController,
//           events: _events,
//           calendarStyle: CalendarStyle(
//             // Customize other calendar styles here
//           ),
//           daysOfWeekStyle: DaysOfWeekStyle(
//             // Customize days of the week style here
//           ),
//           headerStyle: HeaderStyle(
//             // Customize header style here
//           ),
//           builders: CalendarBuilders(
//             dayBuilder: (context, date, events) {
//               return Container(
//                 margin: const EdgeInsets.all(4.0),
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   color: _events[date] == true ? Colors.green : Colors.red,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                   child: Text(
//                     date.day.toString(),
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
