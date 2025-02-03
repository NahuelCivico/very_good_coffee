import 'package:json_annotation/json_annotation.dart';

part 'coffee_model.g.dart';

@JsonSerializable()
class CoffeeModel {
  CoffeeModel({
    required this.imageUrl,
    required this.rating,
    required this.isLiked,
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) =>
      _$CoffeeModelFromJson(json);

  final String imageUrl;
  final String rating;
  final bool isLiked;

  Map<String, dynamic> toJson() => _$CoffeeModelToJson(this);

  CoffeeModel copyWith({
    String? imageUrl,
    String? rating,
    bool? isLiked,
  }) {
    return CoffeeModel(
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
