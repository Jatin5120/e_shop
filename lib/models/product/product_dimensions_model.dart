import 'dart:convert';

class ProductDimensionsModel {
  const ProductDimensionsModel({
    this.width = 0,
    this.height = 0,
    this.depth = 0,
  });

  factory ProductDimensionsModel.fromMap(Map<String, dynamic> map) => ProductDimensionsModel(
        width: (map['width'] as num).toDouble(),
        height: (map['height'] as num).toDouble(),
        depth: (map['depth'] as num).toDouble(),
      );

  factory ProductDimensionsModel.fromJson(
    String source,
  ) =>
      ProductDimensionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final double width;
  final double height;
  final double depth;

  ProductDimensionsModel copyWith({
    double? width,
    double? height,
    double? depth,
  }) =>
      ProductDimensionsModel(
        width: width ?? this.width,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'width': width,
        'height': height,
        'depth': depth,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ProductDimensionsModel(width: $width, height: $height, depth: $depth)';

  @override
  bool operator ==(covariant ProductDimensionsModel other) {
    if (identical(this, other)) return true;

    return other.width == width && other.height == height && other.depth == depth;
  }

  @override
  int get hashCode => width.hashCode ^ height.hashCode ^ depth.hashCode;
}
