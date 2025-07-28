import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serag_app/model/khetma.dart';
import 'package:serag_app/model/privateKhetma.dart';

class KhetmaService {
  final _client = Supabase.instance.client;
  
  final String khetmaTable = 'khetma';
  final String privatePartsTable = 'private_khetma'; 

  // جلب كل الختمات العامة
  Future<List<KhetmaModel>> fetchKhetmas() async {
    final response = await _client
        .from(khetmaTable)
        .select()
        .order('id', ascending: true);

    return (response as List)
        .map((e) => KhetmaModel.fromMap(e))
        .toList();
  }

  Future<List<PrivateKhetmaModel>> fetchPrivatePartsByKhetmaId(String khetmaId) async {
    final response = await _client
        .from(privatePartsTable)
        .select()
        .eq('khetmaId', khetmaId)
        .order('partNumber', ascending: true);

    return (response as List)
        .map((e) => PrivateKhetmaModel.fromMap(e))
        .toList();
  }

  Future<void> addKhetma(KhetmaModel khetma) async {
    await _client.from(khetmaTable).insert([khetma.toMap()]);
  }

  Future<void> addPrivateParts(List<PrivateKhetmaModel> parts) async {
    final data = parts.map((e) => e.toMap()).toList();
    await _client.from(privatePartsTable).insert(data);
  }

  Future<void> markPartAsRead(int partId) async {
    await _client
        .from(privatePartsTable)
        .update({'isRead': true})
        .eq('id', partId);
  }

  Future<void> updatePrivatePart(PrivateKhetmaModel part) async {
    await _client
        .from(privatePartsTable)
        .update(part.toMap())
        .eq('id', part.id);
  }

}
