import 'dart:convert';

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

class KhetmaModel {
  final int id;
  final String purpose;
  final String type;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;

  KhetmaModel({
    required this.id,
    required this.purpose,
    required this.type,
    required this.createdAt,
    this.startDate,
    this.endDate,
  });

  KhetmaModel copyWith({
    int? id,
    String? purpose,
    String? type,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return KhetmaModel(
      id: id ?? this.id,
      purpose: purpose ?? this.purpose,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'purpose': purpose,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }

  factory KhetmaModel.fromMap(Map<String, dynamic> map) {
    return KhetmaModel(
      id: map['id']?.toInt() ?? 0,
      purpose: map['purpose'] ?? '',
      type: map['type'] ?? '',
      createdAt: _parseDate(map['createdAt']) ?? DateTime.now(),
      startDate: _parseDate(map['startDate']),
      endDate: _parseDate(map['endDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory KhetmaModel.fromJson(String source) => KhetmaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KhetmaModel(id: $id, purpose: $purpose, type: $type, createdAt: $createdAt, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KhetmaModel &&
        other.id == id &&
        other.purpose == purpose &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        purpose.hashCode ^
        type.hashCode ^
        createdAt.hashCode ^
        startDate.hashCode ^
        endDate.hashCode;
  }
}
