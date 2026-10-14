// A2 stub: fields will be used during implementation.
// ignore_for_file: unused_field, prefer_final_fields, prefer_initializing_formals

import 'package:flutter/material.dart';

class Availability {
  String day;
  TimeOfDay startTime;
  TimeOfDay endTime;

  // Keep public parameter names for the private fields.
  Availability({
    String day = "",
    TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0),
    TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0),
  })  : day = day,
        startTime = startTime,
        endTime = endTime;

  void setAvailability(List<dynamic> availabilityList) {
    // TODO: Update the availability fields using the list.
    throw UnimplementedError();
  }

  List<dynamic> getAvailability() {
    // TODO: Return the availability values as a list.
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson()
  {
    final String startString = '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
    final String endString = '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
    return {'day': day, 'startTime': startString, 'endTime': endString};
  }
}