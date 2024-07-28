import 'dart:convert';

class ProductReviewModel {
  ProductReviewModel({
    this.rating = 0,
    this.comment = '',
    this.date,
    this.reviewerName = '',
    this.reviewerEmail = '',
  });

  factory ProductReviewModel.fromMap(Map<String, dynamic> map) => ProductReviewModel(
        rating: map['rating'] as int,
        comment: map['comment'] as String,
        date: DateTime.parse(map['date'] as String),
        reviewerName: map['reviewerName'] as String,
        reviewerEmail: map['reviewerEmail'] as String,
      );

  factory ProductReviewModel.fromJson(
    String source,
  ) =>
      ProductReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int rating;
  final String comment;
  final DateTime? date;
  final String reviewerName;
  final String reviewerEmail;

  ProductReviewModel copyWith({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) =>
      ProductReviewModel(
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        reviewerName: reviewerName ?? this.reviewerName,
        reviewerEmail: reviewerEmail ?? this.reviewerEmail,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'rating': rating,
        'comment': comment,
        'date': date?.toIso8601String(),
        'reviewerName': reviewerName,
        'reviewerEmail': reviewerEmail,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductReviewModel(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';

  @override
  bool operator ==(covariant ProductReviewModel other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.date == date &&
        other.reviewerName == reviewerName &&
        other.reviewerEmail == reviewerEmail;
  }

  @override
  int get hashCode => rating.hashCode ^ comment.hashCode ^ date.hashCode ^ reviewerName.hashCode ^ reviewerEmail.hashCode;
}
