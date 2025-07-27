import 'package:serag_app/model/privateKhetma.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PrivateKhetmaService {
  final SupabaseClient client = Supabase.instance.client;
  static const String tableName = 'PrivateKhetma';

  
  Future<List<PrivateKhetmaModel>> fetchParts() async {
    final response = await client
        .from(tableName)
        .select()
        .order('part_number', ascending: true);

    return (response as List)
        .map((item) => PrivateKhetmaModel.fromJson(item))
        .toList();
  }

  Future<void> markPartAsRead(int partId) async {
    await client.from(tableName).update({'is_read': true}).eq('id', partId);
  }
}
