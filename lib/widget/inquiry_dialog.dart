// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InquiryDialog extends StatefulWidget {
  @override
  State<InquiryDialog> createState() => _InquiryDialogState();
}

class _InquiryDialogState extends State<InquiryDialog> {
  bool isSelected = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _descp = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _stime = TextEditingController();
  TextEditingController _etime = TextEditingController();
  TextEditingController _gcal = TextEditingController();

  @override
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
                'Add New Inquiry',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Name*',
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

              SizedBox(height: 8.0),
              Align(
                alignment: FractionalOffset.topLeft,
                child: Container(
                  width: 150,
                  child: DropdownButtonFormField(
                    value: "Type*",
                    items: [
                      DropdownMenuItem(
                        child: Text('Type*'),
                        value: 'Type*',
                      ),
                      DropdownMenuItem(
                        child: Text('Type 1'),
                        value: 'Type 1',
                      ),
                      DropdownMenuItem(
                        child: Text('Type 2'),
                        value: 'Type 2',
                      ),
                      DropdownMenuItem(
                        child: Text('Type 3'),
                        value: 'Type 3',
                      ),
                
                    ],
                    onChanged: (String? value) {  },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                
                  ),
                ),
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
              SizedBox(height: 10),
              TextField(
                controller: _gcal,
                decoration: InputDecoration(
                  hintText: 'Add to google calendar',
                  // suffixIcon: ImageIcon(AssetImage('asset/googleCalendar.png')),
                  suffixIcon: Image.asset(
                    'asset/googleCalendar.png',
                    width:  45,
                    height: 45,
                  ),
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
                        _gcal.text = DateFormat.yMMMMEEEEd('en_US').format(datePicked);
                      });
                    }
                  },
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
                child: Text('Create Inquiry',style: TextStyle(color: Colors.white),),
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