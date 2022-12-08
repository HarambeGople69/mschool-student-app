import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils/styles.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:table_calendar/table_calendar.dart';

class EventCalender extends StatefulWidget {
  const EventCalender({Key? key}) : super(key: key);

  @override
  _EventCalenderState createState() => _EventCalenderState();
}

class _EventCalenderState extends State<EventCalender> {
  // CalendarFormat Format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting(
        'Conference',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false,
      ),
    );
    meetings.add(
      Meeting(
        'Parents meeting',
        startTime.add(
          Duration(days: 1),
        ),
        endTime.add(
          Duration(days: 2),
        ),
        Colors.red,
        false,
      ),
    );
    meetings.add(
      Meeting(
        'Report card distribution',
        startTime.add(
          Duration(days: 5),
        ),
        endTime.add(
          Duration(days: 5),
        ),
        Colors.purple,
        false,
      ),
    );
    print("Start Time: ${startTime}");
    print("Start Time: ${endTime}");
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7294CF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Academic calender",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(25),
          ),
        ),
      ),
      body: Scaffold(
        body: SfCalendar(
          todayHighlightColor: Color.fromARGB(255, 72, 122, 220),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(15),
          ),
          headerHeight: ScreenUtil().setSp(40),
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
            showAgenda: true,
          ),
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
