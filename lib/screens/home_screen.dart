// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print

import 'package:final_project/widget/event_dialog.dart';
import 'package:final_project/widget/inquiry_dialog.dart';
import 'package:final_project/widget/meeting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime _today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _today = day;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,20,0),
            child: Icon(
                Icons.notifications,
            ),
          ),
        ],
        title: Text(
          'Calendar',
          style: TextStyle(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Text('Selected Day = ' + today.toString().split(" ")[0]),
            TableCalendar(
              locale: 'en_US',
              // rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _today),
              focusedDay: _today,
              firstDay: DateTime.utc(2010, 3, 14),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          ],
        ),
      ),

      floatingActionButton: SpeedDial(
        backgroundColor: Color(0xff5a5454),
        // animatedIcon: AnimatedIcons.menu_close,
        child: Icon(Icons.add,color: Colors.white),
        children: [
          SpeedDialChild(
            child: Icon(Icons.event),
            label: 'Add Event',
            onTap: () => showDialog(
                context: context,
                builder: (ctx) => EventDialog()),
          ),
          SpeedDialChild(
            child: Icon(Icons.meeting_room),
            label: 'Add Meeting/Appointment',
            onTap: () => showDialog(
                context: context,
                builder: (ctx) => MeetingDialog()),
          ),
          SpeedDialChild(
            child: Icon(Icons.inbox),
            label: 'Add Inquiry',
            onTap: () => showDialog(
                context: context,
                builder: (ctx) => InquiryDialog()),
          ),
        ],
      ),
    );
  }
}
