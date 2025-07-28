import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serag_app/model/privateKhetma.dart';
import 'package:serag_app/service/privateKhetma.dart';

final privateKhetmaProvider = FutureProvider.family<List<PrivateKhetmaModel>, String>((ref, khetmaId) async {
  final service = KhetmaService();
  return await service.fetchPrivatePartsByKhetmaId(khetmaId);
});
