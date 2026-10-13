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
class SignUpPage extends StatefulWidget{
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
  final confirmPasswordController = TextEditingController();

  String? passwordError; //error message for passwords
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

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
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
                  // onPressed: selectedValue == null
                  //     ? null
                  //     : () async {
                  onPressed: () async {

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

                          // await supabase
                          //     .from('majorselectiontest')
                          //     .insert({'name': selectedValue});
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


// DropdownMenuEntry<String> buildMenuItem(String value) => DropdownMenuEntry(
//   value: value,
//   label: value,
// );
