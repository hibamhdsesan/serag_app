import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serag_app/model/privateKhetma.dart';

class PrivateKhetmaService {
  final _client = Supabase.instance.client;

  final String table = 'private_khetma';

  Future<List<PrivateKhetmaModel>> fetchParts() async {
    final response = await _client.from(table).select().order('id', ascending: true);

    return (response as List)
        .map((e) => PrivateKhetmaModel.fromMap(e))
        .toList();
  }

  Future<void> addParts(List<PrivateKhetmaModel> parts) async {
    final data = parts.map((e) => e.toMap()).toList();
    await _client.from(table).insert(data);
  }

  Future<void> markPartAsRead(int partId) async {
    await _client
        .from(table)
        .update({'isRead': true})
        .eq('id', partId);
  }

  Future<void> deleteKhetma(String purpose, DateTime createdAt) async {
    await _client
        .from(table)
        .delete()
        .match({
          'purpose': purpose,
          'createdAt': createdAt.millisecondsSinceEpoch,
        });
  }

}
