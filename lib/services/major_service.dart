import 'package:supabase_flutter/supabase_flutter.dart';

class MajorsService {
  MajorsService(this.client);

  final SupabaseClient client;

  Future<List<Map<String, dynamic>>> fetchMajors() async {
    return await client
        .from('majorsList')
        .select('id, name')
        .order('name');
  }
}