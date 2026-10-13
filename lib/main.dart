import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:study_buddy_finder/pages/login.dart';

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
<<<<<<< Updated upstream




>>>>>>> Stashed changes
