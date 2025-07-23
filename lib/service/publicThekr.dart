import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:serag_app/model/thekr.dart';

class ThekrService {
  final SupabaseClient client = Supabase.instance.client;

  static const String tableName = 'publicThekr';

  Future<List<ThekrModel>> fetchThekrList() async {
    try {
      final response = await client.from(tableName).select();
      return (response as List<dynamic>)
          .map((item) => ThekrModel.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('$e');
      throw Exception('فشل في جلب بيانات الذكر');
    }
  }

  Future<void> addThekr(ThekrModel thekr) async {
    try {
      await client.from(tableName).insert(thekr.toMap());
    } catch (e) {
      print(' $e');
      throw Exception('فشل في إضافة الذكر');
    }
  }
}
