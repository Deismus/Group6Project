import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
                          selectedValue = newValue;
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
                  onPressed: 
                      () {
                         
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


DropdownMenuEntry<String> buildMenuItem(String value) => DropdownMenuEntry(
  value: value,
  label: value,
);