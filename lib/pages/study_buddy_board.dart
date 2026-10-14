import 'package:flutter/material.dart';

// Starts a standalone preview of the board.
// The team's main app still starts from lib/main.dart.
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudyBuddyBoardPage(),
    ),
  );
}

// Builds the full Study Buddy Board screen.
class StudyBuddyBoardPage extends StatelessWidget {
  const StudyBuddyBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Buddy Board'),
        centerTitle: true,
      ),
      body: Center(
        // Limits the content width on larger screens.
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),

          // Allows scrolling when the cards do not fit on screen.
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              Text(
                'Sample student profiles',
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),

              // TODO: Replace these examples with actual student data.
              StudentProfileCard(
                name: 'Alex',
                major: 'Computer Science',
                course: 'CS 250',
                availability: 'Monday, 10:00 AM–12:00 PM',
              ),

              StudentProfileCard(
                name: 'Sam',
                major: 'Mathematics',
                course: 'MATH 151',
                availability: 'Tuesday, 2:00 PM–4:00 PM',
              ),

              StudentProfileCard(
                name: 'Taylor',
                major: 'Biology',
                course: 'BIOL 100',
                availability: 'Wednesday, 11:00 AM–1:00 PM',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Defines the appearance of one student card.
// This widget displays information; it does not fetch or save data.
class StudentProfileCard extends StatelessWidget {
  final String name;
  final String major;
  final String course;
  final String availability;

  // All four pieces of information must be provided.
  const StudentProfileCard({
    super.key,
    required this.name,
    required this.major,
    required this.course,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Space outside the card, separating it from the next card.
      margin: const EdgeInsets.only(bottom: 16),

      child: Padding(
        // Space inside the card, surrounding the text.
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            Text('Major: $major'),

            const SizedBox(height: 8),
            Text('Course of interest: $course'),

            const SizedBox(height: 8),
            Text('Availability: $availability'),
          ],
        ),
      ),
    );
  }
}