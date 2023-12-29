// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last, prefer_final_fields, annotate_overrides


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventDialog extends StatefulWidget {

  @override
  State<EventDialog> createState() => _EventDialogState();

}

class _EventDialogState extends State<EventDialog> {

  bool isSelected = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _descp = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _stime = TextEditingController();
  TextEditingController _etime = TextEditingController();

  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,

      backgroundColor: Colors.white,

          child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Add New Event',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      hintText: 'Event name*',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descp,
                    decoration: InputDecoration(
                        hintText: 'Type the note here...',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  maxLines: 5,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _date,
                  decoration: InputDecoration(
                      hintText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
              onTap: () async {
                  DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));

                  if (datePicked != null){
                    setState(() {
                      _date.text = DateFormat.yMMMMEEEEd('en_US').format(datePicked);
                    });
                  }
              },
                  ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _stime,
                        decoration: InputDecoration(
                            hintText: 'Start time',
                          suffixIcon: Icon(Icons.access_time),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onTap: () async {
                          var timePicked = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (timePicked != null){
                            setState(() {
                              _stime.text = timePicked.format(context);
                            });
                          }
                        },
                        ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _etime,
                          decoration: InputDecoration(
                              hintText: 'End time',
                            suffixIcon: Icon(Icons.access_time),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        onTap: () async {
                          var timePicked = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          if (timePicked != null){
                            setState(() {
                              _etime.text = timePicked.format(context);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  title: Text('Reminds me'),
                  value: isSelected,
                  onChanged: (bool value){
                    setState((){
                      isSelected = !isSelected;
                    });
                  },
                  activeTrackColor: Color(0xFF575151),

                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    
                  },
                  child: Text('Create Event', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF575151),
                    ),
                  ),
                ),
              ],
            ),
                  ),
          ),
        );
  }
}