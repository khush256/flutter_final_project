import 'dart:convert';
import 'package:http/http.dart' as http;
import '../solids/event.dart';

class DBconnect {

  final url = Uri.parse('https://finalproject-4c385-default-rtdb.firebaseio.com/');
  
  Future<void> addData(Event data) async {
    http.post(url, body: json.encode({
     'name': data.name,
     'descp': data.descp,
     'date': data.date,
     'stime': data.stime,
     'etime': data.etime,
    }));
  }

  
}