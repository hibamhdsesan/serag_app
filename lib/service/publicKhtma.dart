import 'package:serag_app/model/publicKhtma.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PublicKhetmaService {
  final SupabaseClient client = Supabase.instance.client;

  static const String tableName = 'publicKhetma';

  Future<List<PublicKhetmaModel>> fetchKhetmaList() async {
    try {
      final response = await client.from(tableName).select();
      return (response as List<dynamic>)
          .map((item) => PublicKhetmaModel.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching public khetma: $e');
      throw Exception('فشل في جلب بيانات الختمة');
    }
  }

  Future<void> addKhetma(PublicKhetmaModel khetma) async {
    try {
      await client.from(tableName).insert(khetma.toMap());
    } catch (e) {
      print('Error adding public khetma: $e');
      throw Exception('فشل في إضافة الختمة');
    }
  }
}
