// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeModel _$CoffeeModelFromJson(Map<String, dynamic> json) => CoffeeModel(
      imageUrl: json['imageUrl'] as String,
      rating: json['rating'] as String,
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$CoffeeModelToJson(CoffeeModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'rating': instance.rating,
      'isLiked': instance.isLiked,
    };
