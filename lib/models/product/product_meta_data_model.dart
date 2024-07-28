import 'dart:convert';

class ProductMetaDataModel {
  const ProductMetaDataModel({
    this.createdAt,
    this.updatedAt,
    this.barcode = '',
    this.qrCode = '',
  });

  factory ProductMetaDataModel.fromMap(Map<String, dynamic> map) => ProductMetaDataModel(
        createdAt: DateTime.parse(map['createdAt'] as String),
        updatedAt: DateTime.parse(map['updatedAt'] as String),
        barcode: map['barcode'] as String,
        qrCode: map['qrCode'] as String,
      );

  factory ProductMetaDataModel.fromJson(
    String source,
  ) =>
      ProductMetaDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String barcode;
  final String qrCode;

  ProductMetaDataModel copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) =>
      ProductMetaDataModel(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        barcode: barcode ?? this.barcode,
        qrCode: qrCode ?? this.qrCode,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'barcode': barcode,
        'qrCode': qrCode,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ProductMetaDataModel(createdAt: $createdAt, updatedAt: $updatedAt, barcode: $barcode, qrCode: $qrCode)';

  @override
  bool operator ==(covariant ProductMetaDataModel other) {
    if (identical(this, other)) return true;

    return other.createdAt == createdAt && other.updatedAt == updatedAt && other.barcode == barcode && other.qrCode == qrCode;
  }

  @override
  int get hashCode => createdAt.hashCode ^ updatedAt.hashCode ^ barcode.hashCode ^ qrCode.hashCode;
}
