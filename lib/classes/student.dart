import 'availability.dart';
import 'meeting_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

final supabase = Supabase.instance.client;

class Student {
  String _id = '';
  String _studentId = '';
  String _name = '';
  String _majorId = '';
  String _password =  '';
  String _courseOfInterest = '';
  String _contactInfo = '';
  List<Availability> _availability = [];
  //String preferredStudyMethod = '';
  bool _contactVisibility = false;
  //String? location;
  List<Student> _studyBuddies = [];
  List<MeetingRequest> _meetingRequests = [];

  //Default constructor
  Student(String studentId, String name, String password, String majorId, String courseOfInterest, String contactInfo, bool contactVisibility,
           List<Availability> availability)
  {
    _studentId = studentId;
    _name = name;
    _majorId = majorId;
    _courseOfInterest = courseOfInterest;
    _contactInfo = contactInfo;
    _contactVisibility = contactVisibility;
    _availability = availability;

    var bytes = utf8.encode(password); 
    var hashedPassword = md5.convert(bytes).toString();
    _password = hashedPassword;

  }
  // Builds the student's profile from the info filled in the form.
  void createProfile() async
  {
    //Converts all the availability data in json data
    List<Map<String, dynamic>> availabilityJsons = List<Map<String, dynamic>>.empty(growable: true);
    for(int i = 0; i < _availability.length; i++)
    {
      availabilityJsons.add(_availability[i].toJson());
    }

    //sends supabase the data regarding student
    await supabase.from('test-users').insert(
      {
        'redID': _studentId, 
        'name': _name, 
        'password': _password, 
        'contactInfo': _contactInfo,
        'majorID': _majorId,
        'courseOfInterest': _courseOfInterest,
        'availability': _availability,
        'contactVisibility': _contactVisibility,
      });

    
  }
  
  // Saves the profile; returns true if it worked.
  bool saveProfile() {
    return false;
  }
  
  // Adds another student to this student's study buddies.
  void addStudyBuddy(Student buddy) 
  {
    
  }
  
  // Returns the list of this student's study buddies.
  List<Student> viewStudyBuddies() {
    return _studyBuddies;
  }
  
  // Returns a short summary (name, major, shared courses) shown on a card.
  String getSummary() {
    return '$_name - $_majorId - $_courseOfInterest';
  }

}
