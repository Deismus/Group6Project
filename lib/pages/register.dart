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
  final contactController = TextEditingController();

  List<Availability> slots = [Availability()];

  String? passwordError;
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
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: redIdController,
                  decoration: const InputDecoration(
                    labelText: 'Red ID',
                  ),
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
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PatternInputFormatter(patterns: ['###-###-####']),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Availability'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      tooltip: 'Add another time slot',
                      onPressed: () => setState(() => slots.add(Availability())),
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

                const SizedBox(height: 12),

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
                
                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: 
                      () {
                          if (passwordController.text != confirmPasswordController.text) {
                            setState(() {
                              passwordError = 'Passwords do not match';
                            });
                            return;
                          }
                          else if (passwordController.text.length < 8 || passwordController.text.length > 20) {
                            setState(() {
                              passwordError = 'Password must be 8-20 characters long';
                            });
                            return;
                          }

                          setState(() {
                            passwordError = null;
                          });

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