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

class PrivateKhetmaModel {
  final int id;
  final int khetmaId; 
  final int partNumber;
  final bool isRead;
  final DateTime createdAt;

  PrivateKhetmaModel({
    required this.id,
    required this.khetmaId,
    required this.partNumber,
    required this.isRead,
    required this.createdAt,
  });

  PrivateKhetmaModel copyWith({
    int? id,
    int? khetmaId,
    int? partNumber,
    bool? isRead,
    String? purpose,
    String? type,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return PrivateKhetmaModel(
      id: id ?? this.id,
      khetmaId: khetmaId ?? this.khetmaId,
      partNumber: partNumber ?? this.partNumber,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'khetmaId': khetmaId,
      'partNumber': partNumber,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory PrivateKhetmaModel.fromMap(Map<String, dynamic> map) {
    return PrivateKhetmaModel(
      id: map['id']?.toInt() ?? 0,
      khetmaId: map['khetmaId']?.toInt() ?? 0,
      partNumber: map['partNumber']?.toInt() ?? 0,
      isRead: map['isRead'] ?? false,
      createdAt: _parseDate(map['createdAt']) ?? DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PrivateKhetmaModel.fromJson(String source) =>
      PrivateKhetmaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PrivateKhetmaModel(id: $id, khetmaId: $khetmaId, partNumber: $partNumber, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrivateKhetmaModel &&
        other.id == id &&
        other.khetmaId == khetmaId &&
        other.partNumber == partNumber &&
        other.isRead == isRead &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        khetmaId.hashCode ^
        partNumber.hashCode ^
        isRead.hashCode ^
        
        createdAt.hashCode;
  }
}
