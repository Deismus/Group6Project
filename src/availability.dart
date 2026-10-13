// A2 stub: fields will be used during implementation.
// ignore_for_file: unused_field, prefer_final_fields, prefer_initializing_formals

class Availability {
  String _day;
  DateTime _startTime;
  DateTime _endTime;

  // Keep public parameter names for the private fields.
  Availability({
    required String day,
    required DateTime startTime,
    required DateTime endTime,
  })  : _day = day,
        _startTime = startTime,
        _endTime = endTime;

  void setAvailability(List<dynamic> availabilityList) {
    // TODO: Update the availability fields using the list.
    throw UnimplementedError();
  }

  List<dynamic> getAvailability() {
    // TODO: Return the availability values as a list.
    throw UnimplementedError();
  }
}