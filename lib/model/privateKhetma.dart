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

class PrivateKhetmaModel {
  final int id;
  final int partNumber;
  final bool isRead;
  final String purpose;
  final String type;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  PrivateKhetmaModel({
    required this.id,
    required this.partNumber,
    required this.isRead,
    required this.purpose,
    required this.type,
    required this.createdAt,
    this.startDate,
    this.endDate,
  });

  PrivateKhetmaModel copyWith({
    int? id,
    int? partNumber,
    bool? isRead,
    String? purpose,
    String? type,
    DateTime? createdAt,
    ValueGetter<DateTime?>? startDate,
    ValueGetter<DateTime?>? endDate,
  }) {
    return PrivateKhetmaModel(
      id: id ?? this.id,
      partNumber: partNumber ?? this.partNumber,
      isRead: isRead ?? this.isRead,
      purpose: purpose ?? this.purpose,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate != null ? startDate() : this.startDate,
      endDate: endDate != null ? endDate() : this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'partNumber': partNumber,
      'isRead': isRead,
      'purpose': purpose,
      'type': type,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'startDate': startDate?.millisecondsSinceEpoch,
      'endDate': endDate?.millisecondsSinceEpoch,
    };
  }

  factory PrivateKhetmaModel.fromMap(Map<String, dynamic> map) {
    return PrivateKhetmaModel(
      id: map['id']?.toInt() ?? 0,
      partNumber: map['partNumber']?.toInt() ?? 0,
      isRead: map['isRead'] ?? false,
      purpose: map['purpose'] ?? '',
      type: map['type'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      startDate: map['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startDate']) : null,
      endDate: map['endDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endDate']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivateKhetmaModel.fromJson(String source) => PrivateKhetmaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PrivateKhetmaModel(id: $id, partNumber: $partNumber, isRead: $isRead, purpose: $purpose, type: $type, createdAt: $createdAt, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PrivateKhetmaModel &&
      other.id == id &&
      other.partNumber == partNumber &&
      other.isRead == isRead &&
      other.purpose == purpose &&
      other.type == type &&
      other.createdAt == createdAt &&
      other.startDate == startDate &&
      other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      partNumber.hashCode ^
      isRead.hashCode ^
      purpose.hashCode ^
      type.hashCode ^
      createdAt.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
  }
}
