import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:study_buddy_finder/classes/student.dart';
import 'package:study_buddy_finder/classes/availability.dart';
import 'package:pattern_input_formatter/pattern_input_formatter.dart';

final supabase = Supabase.instance.client;

class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Get the list of majors from Supabase
  final majorsList = supabase.from('majorslist').select();
  final classesList = supabase.from('classes').select().order('course-code', ascending: false);

  final redIdController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final contactInfoController = TextEditingController();

  List<Availability> slots = [Availability()];

  //TextField error variables
  String? passwordError;
  String? nameError;
  String? redIdError;
  String? contactError;

  //DropdownMenu errors
  String? majorError;
  String? classError;
  String? availabilityError;

  String? selectedValue;
  bool _isChecked = false; //contact visibility
  String? selectedMajor;
  String? selectedClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Profile')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter a first name that is less than 30 characters',
                    errorText: nameError,
                  ),
                  keyboardType: TextInputType.text,
                    inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: redIdController,
                  decoration: InputDecoration(
                    labelText: 'Red ID',
                    errorText: redIdError,
                    hintText: 'Input your full RedID'
                  ),
                  keyboardType: TextInputType.number,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PatternInputFormatter(patterns: ['#########']),
                  ],
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter a password that is 8-20 in length',
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    errorText: passwordError,
                  ),
                ),

                const SizedBox(height: 12),
                
                TextField(
                  controller: contactInfoController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    errorText: contactError,
                    hintText: '###-###-####',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PatternInputFormatter(patterns: ['###-###-####']),
                  ],
                ),

                Row(
                  children: <Widget>[
                    const Text('Contact Visibility'),
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue ?? false;
                        });
                      },
                    ),
                  ]
                ),

                // Get the majors from Supabase
                FutureBuilder(
                  future: majorsList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final majors = snapshot.data!;

                    return DropdownMenu<String>(
                      hintText: 'Select a major',
                      expandedInsets: EdgeInsets.zero,
                      dropdownMenuEntries: majors.map((major) {
                        final name = major['name'] as String;
                        
                        return DropdownMenuEntry<String>(
                          value: name,
                          label: name,
                        );
                      }).toList(),
                      onSelected: (String? newValue) {
                        setState(() {
                          selectedMajor = newValue;
                        });
                      },
                    );
                    
                  },
                ),

                if (majorError != null)
                  Text(
                    majorError!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 179, 38, 30),
                      fontSize: 12,
                    ),
                  ),
                
                const SizedBox(height: 12),
                
                FutureBuilder(
                  future: classesList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final classes = snapshot.data!;

                    return DropdownMenu<String>(
                      hintText: 'Select a class',
                      initialSelection: selectedClass,
                      expandedInsets: EdgeInsets.zero,
                      dropdownMenuEntries: classes.map((classes) {
                        final name = classes['course-code'] as String;

                        return DropdownMenuEntry<String>(
                          value: name,
                          label: name,
                        );
                      }).toList(),
                      onSelected: (String? newValue) {
                        setState(() {
                          selectedClass = newValue;
                        });
                      },
                    );
                  },
                ),
                
                if (classError != null)
                  Text(
                    classError!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 179, 38, 30),
                      fontSize: 12,
                    ),
                  ),

                const SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Availability'),

                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          tooltip: 'Remove time slot',
                          onPressed: slots.length > 1 ? () => setState(() => slots.removeLast()) : null,
                        ),

                        IconButton(
                          icon: const Icon(Icons.add),
                          tooltip: 'Add another time slot',
                          onPressed: slots.length < 7 ? () => setState(() => slots.add(Availability())) : null,
                        ),
                      ],
                    ),
                  ],
                ),

                // One row (Day / Start / End) per time slot
                for (int i = 0; i < slots.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        // Day
                        Expanded(
                          child: DropdownMenu<String>(
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'Day',
                            dropdownMenuEntries: [
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              'Friday',
                              'Saturday',
                              'Sunday',
                            ].map(buildMenuItem).toList(),
                            onSelected: (v) => setState(() => slots[i].day = v!),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Start time
                        Expanded(
                          child: DropdownMenu<TimeOfDay>(
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'Start',
                            dropdownMenuEntries: timeEntries(),
                            onSelected: (v) =>
                                setState(() => slots[i].startTime = v!),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // End time
                        Expanded(
                          child: DropdownMenu<TimeOfDay>(
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'End',
                            dropdownMenuEntries: timeEntries(),
                            onSelected: (v) => setState(() => slots[i].endTime = v!),
                          ),
                        ),
                      ],
                    ),
                  ),

                if (availabilityError != null)
                  Text(
                    availabilityError!,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 179, 38, 30),
                      fontSize: 12,
                    ),
                  ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: 
                      () {
                          //Edge Cases:
                          if(nameController.text.length > 30) {
                            setState(() {
                              nameError = 'Name is longer than 30 characters';
                            });
                          }
                          else if(nameController.text.isEmpty) {
                            setState(() {
                              nameError = 'Name cannot be empty';
                            });
                          }
                          else {
                            setState(() {
                              nameError = null;
                            });
                          }

                          //only counts the digits and excludes the "#"s
                          if(redIdController.text.replaceAll(RegExp(r'\D'), '').length != 9) {
                            setState(() {
                              redIdError = 'Red ID must be 9 characters long';
                            });
                          }
                          else {
                            setState(() {
                              redIdError = null;
                            });
                          }


                          if (passwordController.text != confirmPasswordController.text) {
                            setState(() {
                              passwordError = 'Passwords do not match';
                            });
                          }
                          else if (passwordController.text.length < 8 || passwordController.text.length > 20) {
                            setState(() {
                              passwordError = 'Password must be 8-20 characters long';
                            });
                          }
                          else {  
                            setState(() {
                              passwordError = null;
                            });
                          }

                          if(contactInfoController.text.replaceAll(RegExp(r'\D'), '').length != 10) {
                            setState(() {
                              contactError = 'Enter a full 10-digit phone number';
                            });
                          }
                          else if(contactInfoController.text.replaceAll(RegExp(r'\D'), '').isEmpty) {
                            setState(() {
                              contactError = 'Phone number cannot be empty';
                            });
                          }
                          else {
                            setState(() {
                              contactError = null;
                            });
                          }

                          if (selectedMajor == null) {
                            setState(() {
                              majorError = 'Please select a major';
                            });
                          } 
                          else {
                            setState(() {
                              majorError = null;
                            });
                          }

                          if (selectedClass == null) {
                            setState(() {
                              classError = 'Please select a class';
                            });
                          } else {
                            setState(() {
                              classError = null;
                            });
                          }

                          bool availabilityComplete = true;
                          bool availabilityValid = true;

                          for (final slot in slots) {
                            //Make sure day, start, and end are selected by checking aganist their default values
                            if (slot.day.isEmpty || (slot.startTime.hour == 0 && slot.startTime.minute == 0) || (slot.endTime.hour == 0 && slot.endTime.minute == 0)) {
                              availabilityComplete = false;
                              break;
                            }

                            //Convert each time to minutes after midnight
                            final startMinutes = slot.startTime.hour * 60 + slot.startTime.minute;
                            final endMinutes = slot.endTime.hour * 60 + slot.endTime.minute;

                            //End time must be later than start time
                            if (endMinutes <= startMinutes) {
                              availabilityValid = false;
                              break;
                            }
                          }

                          if (!availabilityComplete) {
                            setState(() {
                              availabilityError = 'Availability must be completed';
                            });
                          } else if (!availabilityValid) {
                            setState(() {
                              availabilityError = 'End time must be after start time';
                            });
                          } else {
                            setState(() {
                              availabilityError = null;
                            });
                          }

                          if (nameError != null || passwordError != null || redIdError != null || contactError != null || majorError != null || classError != null || availabilityError != null) {
                            return;
                          }

                          String defMajor = selectedMajor!;
                          String defClass = selectedClass!;
                          Student newStudent = Student(
                            redIdController.text, 
                            nameController.text, 
                            passwordController.text,
                            defMajor,
                            defClass,
                            contactInfoController.text,
                            false,
                            slots
                            );
                          newStudent.createProfile();
                        },
                  child: const Text('Submit Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// The times shown in the Start / End dropdowns (08:00 to 20:00, every 30 min).
List<DropdownMenuEntry<TimeOfDay>> timeEntries() {
  final entries = <DropdownMenuEntry<TimeOfDay>>[];
  for (int h = 8; h <= 20; h++) {
    for (final m in [0, 30]) {
      if (h == 20 && m == 30) continue;
      final label =
          '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
      entries.add(DropdownMenuEntry(
        value: TimeOfDay(hour: h, minute: m),
        label: label,
      ));
    }
  }
  return entries;
}

DropdownMenuEntry<String> buildMenuItem(String value) => DropdownMenuEntry(
  value: value,
  label: value,
);