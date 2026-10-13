import 'availability.dart';
import 'meeting_request.dart';

class Student {
  String id = '';
  String studentId = '';
  String name = '';
  String majorId = '';
  String courseOfInterest = '';
  List<Availability> availability = [];
  String preferredStudyMethod = '';
  bool contactVisibility = false;
  String? location;
  List<Student> studyBuddies = [];
  List<MeetingRequest> meetingRequests = [];

  // Builds the student's profile from the info filled in the form.
  void createProfile() {}
  
  // Saves the profile; returns true if it worked.
  bool saveProfile() {
    return false;
  }
  
  // Adds another student to this student's study buddies.
  void addStudyBuddy(Student buddy) {}
  
  // Returns the list of this student's study buddies.
  List<Student> viewStudyBuddies() {
    return studyBuddies;
  }
  
  // Returns a short summary (name, major, shared courses) shown on a card.
  String getSummary() {
    return '$name - $majorId - $courseOfInterest';
  }

}
