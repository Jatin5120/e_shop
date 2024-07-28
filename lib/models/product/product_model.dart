import 'dart:convert';

import 'package:e_shop/models/models.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  ProductModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.category = '',
    this.price = 0,
    this.discountPercentage = 0,
    this.rating = 0,
    this.stock = 0,
    this.tags = const [],
    this.brand = '',
    this.sku = '',
    this.weight = 0,
    this.dimensions = const ProductDimensionsModel(),
    this.warrantyInformation = '',
    this.shippingInformation = '',
    this.availabilityStatus = '',
    this.reviews = const [],
    this.returnPolicy = '',
    this.minimumOrderQuantity = 0,
    this.meta = const ProductMetaDataModel(),
    this.images = const [],
    this.thumbnail = '',
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'] as int? ?? 0,
        title: map['title'] as String? ?? '',
        description: map['description'] as String? ?? '',
        category: map['category'] as String? ?? '',
        price: (map['price'] as num? ?? 0).toDouble(),
        discountPercentage: (map['discountPercentage'] as num? ?? 0).toDouble(),
        rating: (map['rating'] as num? ?? 0).toDouble(),
        stock: map['stock'] as int,
        tags: (map['tags'] as List).cast<String>(),
        brand: map['brand'] as String? ?? '',
        sku: map['sku'] as String,
        weight: (map['weight'] as num).toDouble(),
        dimensions: ProductDimensionsModel.fromMap(map['dimensions'] as Map<String, dynamic>),
        warrantyInformation: map['warrantyInformation'] as String,
        shippingInformation: map['shippingInformation'] as String,
        availabilityStatus: map['availabilityStatus'] as String,
        reviews: (map['reviews'] as List? ?? [])
            .map<ProductReviewModel>(
              (x) => ProductReviewModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
        returnPolicy: map['returnPolicy'] as String,
        minimumOrderQuantity: map['minimumOrderQuantity'] as int,
        meta: ProductMetaDataModel.fromMap(map['meta'] as Map<String, dynamic>),
        images: (map['images'] as List).cast<String>(),
        thumbnail: map['thumbnail'] as String,
      );

  factory ProductModel.fromJson(
    String source,
  ) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final ProductDimensionsModel dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ProductReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final ProductMetaDataModel meta;
  final List<String> images;
  final String thumbnail;

  double get discountPrice => price * (1 - discountPercentage / 100);

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    double? weight,
    ProductDimensionsModel? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ProductReviewModel>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    ProductMetaDataModel? meta,
    List<String>? images,
    String? thumbnail,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        category: category ?? this.category,
        price: price ?? this.price,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        rating: rating ?? this.rating,
        stock: stock ?? this.stock,
        tags: tags ?? this.tags,
        brand: brand ?? this.brand,
        sku: sku ?? this.sku,
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        warrantyInformation: warrantyInformation ?? this.warrantyInformation,
        shippingInformation: shippingInformation ?? this.shippingInformation,
        availabilityStatus: availabilityStatus ?? this.availabilityStatus,
        reviews: reviews ?? this.reviews,
        returnPolicy: returnPolicy ?? this.returnPolicy,
        minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
        meta: meta ?? this.meta,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
        'category': category,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'tags': tags,
        'brand': brand,
        'sku': sku,
        'weight': weight,
        'dimensions': dimensions.toMap(),
        'warrantyInformation': warrantyInformation,
        'shippingInformation': shippingInformation,
        'availabilityStatus': availabilityStatus,
        'reviews': reviews.map((x) => x.toMap()).toList(),
        'returnPolicy': returnPolicy,
        'minimumOrderQuantity': minimumOrderQuantity,
        'meta': meta.toMap(),
        'images': images,
        'thumbnail': thumbnail,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, brand: $brand, sku: $sku, weight: $weight, dimensions: $dimensions, warrantyInformation: $warrantyInformation, shippingInformation: $shippingInformation, availabilityStatus: $availabilityStatus, reviews: $reviews, returnPolicy: $returnPolicy, minimumOrderQuantity: $minimumOrderQuantity, meta: $meta, images: $images, thumbnail: $thumbnail)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        listEquals(other.tags, tags) &&
        other.brand == brand &&
        other.sku == sku &&
        other.weight == weight &&
        other.dimensions == dimensions &&
        other.warrantyInformation == warrantyInformation &&
        other.shippingInformation == shippingInformation &&
        other.availabilityStatus == availabilityStatus &&
        listEquals(other.reviews, reviews) &&
        other.returnPolicy == returnPolicy &&
        other.minimumOrderQuantity == minimumOrderQuantity &&
        other.meta == meta &&
        listEquals(other.images, images) &&
        other.thumbnail == thumbnail;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      price.hashCode ^
      discountPercentage.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      tags.hashCode ^
      brand.hashCode ^
      sku.hashCode ^
      weight.hashCode ^
      dimensions.hashCode ^
      warrantyInformation.hashCode ^
      shippingInformation.hashCode ^
      availabilityStatus.hashCode ^
      reviews.hashCode ^
      returnPolicy.hashCode ^
      minimumOrderQuantity.hashCode ^
      meta.hashCode ^
      images.hashCode ^
      thumbnail.hashCode;
}
