import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
Future<void> main() async {
  await Supabase.initialize(
    url: 'https://hjvahwgljwbceonwzyck.supabase.co/',
    publishableKey: 'sb_publishable_MSnsDi7Oan_VdM-6RAvuoQ_CCdhlIGG',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Major List',
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: Center(
        child:ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 200.0,
          ),
          child:Column(
          spacing: 10,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'RedID',
              ),
            ),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
              ),
            ),
          
            ElevatedButton(
              child: const Text('Log in'),
              onPressed: () {

              },
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline, // Adds the underline look
                  fontSize: 16,
                ),
              ),
            ),
          ],
        )
        ),
        
      ),
    ); 
  }
}

/*
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  final _future = supabase
      .from('majorslist')
      .select();
  String? selectedValue = "N/A";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error loading instruments: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final instruments = snapshot.data!;
          final itemCount = instruments.length;
          List<String> list =[];
          for(int i = 0; i < itemCount; i++)
          {
            list.add(instruments[i]['name']);
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            DropdownMenu(
            hintText: "Select an option",
            dropdownMenuEntries: list.map(buildMenuItem).toList(),
            onSelected: (String? newValue){
              selectedValue = newValue;
            }),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: selectedValue == null ? null
              : () async {
                await supabase.from('majorselectiontest').insert({'name': '$selectedValue'});
              },
              child: const Text('Submit Data'),
            )
            ],
          );
          
        },
      ),
    );
  }
}

*/

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Get the list of majors from Supabase
  final _future = supabase.from('majorslist').select();

  final redIdController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  List<SlotInput> slots = [SlotInput()]; // all the availability rows
  String? selectedValue;

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
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 12),

                // Availability title + the + button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Availability'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      tooltip: 'Add another time slot',
                      onPressed: () => setState(() => slots.add(SlotInput())),
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
                            onSelected: (v) => setState(() => slots[i].day = v),
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
                                setState(() => slots[i].start = v),
                          ),
                        ),

                        const SizedBox(width: 8),

                        // End time
                        Expanded(
                          child: DropdownMenu<TimeOfDay>(
                            expandedInsets: EdgeInsets.zero,
                            hintText: 'End',
                            dropdownMenuEntries: timeEntries(),
                            onSelected: (v) => setState(() => slots[i].end = v),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 12),

                // Get the majors from Supabase
                FutureBuilder(
                  future: _future,
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
                          selectedValue = newValue;
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
                  onPressed: selectedValue == null
                      ? null
                      : () async {
                          await supabase
                              .from('majorselectiontest')
                              .insert({'name': selectedValue});
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

// One availability row: the day, the start time and the end time.
class SlotInput {
  String? day;
  TimeOfDay? start;
  TimeOfDay? end;
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
