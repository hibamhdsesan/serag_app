import 'dart:convert';

import 'package:flutter/widgets.dart';

int? parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}


DateTime? _parseDate(dynamic value) {
  if (value == null) return null;

  if (value is int) {
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  if (value is String) {
    try {
      return DateTime.parse(value); 
    } catch (_) {
      return null;
    }
  }

  return null;
}


class ThekrModel {
  final int? id;
  final String? thekrType;
  final int? targetCount;
  final int? completedCount;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? personCount;
  final String? personName;
  ThekrModel({
    this.id,
    this.thekrType,
    this.targetCount,
    this.completedCount,
    this.startDate,
    this.endDate,
    this.personCount,
    this.personName,
  });


  ThekrModel copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? thekrType,
    ValueGetter<int?>? targetCount,
    ValueGetter<int?>? completedCount,
    ValueGetter<DateTime?>? startDate,
    ValueGetter<DateTime?>? endDate,
    ValueGetter<int?>? personCount,
    ValueGetter<String?>? personName,
  }) {
    return ThekrModel(
      id: id != null ? id() : this.id,
      thekrType: thekrType != null ? thekrType() : this.thekrType,
      targetCount: targetCount != null ? targetCount() : this.targetCount,
      completedCount: completedCount != null ? completedCount() : this.completedCount,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
      personCount: personCount != null ? personCount() : this.personCount,
      personName: personName != null ? personName() : this.personName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      
      'thekrType': thekrType,
      'targetCount': targetCount,
      'completedCount': completedCount,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'personCount': personCount,
      'personName': personName,
    };
  }

  factory ThekrModel.fromMap(Map<String, dynamic> map) {
  return ThekrModel(
    id: parseInt(map['id']),
    thekrType: map['thekrType'],
    targetCount: parseInt(map['targetCount']),
    completedCount: parseInt(map['completedCount']),
    startDate: _parseDate(map['startDate']),
    endDate: _parseDate(map['endDate']),
    personCount: parseInt(map['personCount']),
    personName: map['personName'],
  );
}


  String toJson() => json.encode(toMap());

  factory ThekrModel.fromJson(String source) => ThekrModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ThekrModel(id: $id, thekrType: $thekrType, targetCount: $targetCount, completedCount: $completedCount, startDate: $startDate, endDate: $endDate, personCount: $personCount, personName: $personName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ThekrModel &&
      other.id == id &&
      other.thekrType == thekrType &&
      other.targetCount == targetCount &&
      other.completedCount == completedCount &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.personCount == personCount &&
      other.personName == personName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      thekrType.hashCode ^
      targetCount.hashCode ^
      completedCount.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      personCount.hashCode ^
      personName.hashCode;
  }
}
