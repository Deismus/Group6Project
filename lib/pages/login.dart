import 'package:flutter/material.dart';
import 'package:study_buddy_finder/pages/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
            mainAxisAlignment: MainAxisAlignment.center, // Centers vertically
            crossAxisAlignment: CrossAxisAlignment.center,
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