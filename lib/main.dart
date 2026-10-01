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

DropdownMenuEntry<String> buildMenuItem(String value) => DropdownMenuEntry(
  value: value,
  label: value,
);
