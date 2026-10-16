import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final supabaseUrl = Platform.environment['TEST_SUPABASE_URL'] ?? 'https://hjvahwgljwbceonwzyck.supabase.co/';
  final publishableKey = Platform.environment['TEST_SUPABASE_PUBLISHABLE_KEY'] ?? 'sb_publishable_MSnsDi7Oan_VdM-6RAvuoQ_CCdhlIGG';

  setUpAll(() async {
    // Pass the publishable key into the SDK's anonKey parameter
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: publishableKey, 
    );
  });

  
    testWidgets('End-to-End: Auth User Creation and Profile Row Isolation', (tester) async {
      final client = Supabase.instance.client;
  
      final List<Map<String, dynamic>> responseMajors = await client
          .from('majorslist')
          .select();

      expect(reponseMajors, isNotEmpty);
      expect(responseMajors.first['name'], 'Accountancy');

      final List<Map<String, dynamic>> responseClasses = await client
          .from('classes')
          .select();

      expect(responseClasses, isNotEmpty);
      expect(responseClasses.first['course-code'], 'PHIL 535')

      //Change the table tested to users once the users table is populated with at least one entry
      final List<Map<String, dynamic>> responseUsers = await client
          .from('test-users')
          .select();

      expect(responseClasses, isNotEmpty);
      expect(responseClasses.first['name'], 'John Doe')
    });
}
}
