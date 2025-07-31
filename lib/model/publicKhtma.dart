import 'dart:convert';

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

class PublicKhetmaModel {
  final int? id;
  final String purpose;
  final String type;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? personCount;
  final String? personName;
  final int? numberOfParts;

  PublicKhetmaModel({
    this.id,
    required this.purpose,
    required this.type,
    required this.createdAt,
    this.startDate,
    this.endDate,
    this.personCount,
    this.personName,
    this.numberOfParts,
  });

  PublicKhetmaModel copyWith({
    int? id,
    String? purpose,
    String? type,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
    int? personCount,
    String? personName,
    int? numberOfParts,
  }) {
    return PublicKhetmaModel(
      id: id ?? this.id,
      purpose: purpose ?? this.purpose,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      personCount: personCount ?? this.personCount,
      personName: personName ?? this.personName,
      numberOfParts: numberOfParts ?? this.numberOfParts,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'purpose': purpose,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'personCount': personCount,
      'personName': personName,
      'numberOfParts': numberOfParts,
    };
    // لا تضف id إذا كان null
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory PublicKhetmaModel.fromMap(Map<String, dynamic> map) {
    return PublicKhetmaModel(
      id: parseInt(map['id']),
      purpose: map['purpose'] ?? '',
      type: map['type'] ?? '',
      createdAt: _parseDate(map['createdAt']) ?? DateTime.now(),
      startDate: _parseDate(map['startDate']),
      endDate: _parseDate(map['endDate']),
      personCount: parseInt(map['personCount']),
      personName: map['personName'],
      numberOfParts: parseInt(map['numberOfParts']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PublicKhetmaModel.fromJson(String source) =>
      PublicKhetmaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PublicKhetmaModel(id: $id, purpose: $purpose, type: $type, createdAt: $createdAt, startDate: $startDate, endDate: $endDate, personCount: $personCount, personName: $personName, numberOfParts: $numberOfParts)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PublicKhetmaModel &&
        other.id == id &&
        other.purpose == purpose &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.personCount == personCount &&
        other.personName == personName &&
        other.numberOfParts == numberOfParts;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        purpose.hashCode ^
        type.hashCode ^
        createdAt.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        personCount.hashCode ^
        personName.hashCode ^
        numberOfParts.hashCode;
  }
}
