import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_buddy_finder/classes/availability.dart';

void main() {
  test('TC-2: end time before start time is rejected', () {
    expect(
      () => Availability(
        day: 'Monday',
        startTime: const TimeOfDay(hour: 9, minute: 0),
        endTime: const TimeOfDay(hour: 8, minute: 0),
      ),
      throwsA(anything),
    );
  });

  test('TC-3: end time equal to start time is rejected', () {
    expect(
      () => Availability(
        day: 'Monday',
        startTime: const TimeOfDay(hour: 9, minute: 0),
        endTime: const TimeOfDay(hour: 9, minute: 0),
      ),
      throwsA(anything),
    );
  });
}