import 'dart:convert';
import 'package:flutter/foundation.dart';

class Motorbike {
  final String nameMotorbike;
  final List<String> images;

  Motorbike({
    required this.nameMotorbike,
    required this.images,
  });



  Motorbike copyWith({
    String? nameMotorbike,
    List<String>? images,
  }) {
    return Motorbike(
      nameMotorbike: nameMotorbike ?? this.nameMotorbike,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameMotorbike': nameMotorbike,
      'images': images,
    };
  }

  factory Motorbike.fromMap(Map<String, dynamic> map) {
    return Motorbike(
      nameMotorbike: map['nameMotorbike'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Motorbike.fromJson(String source) => Motorbike.fromMap(json.decode(source));

  @override
  String toString() => 'Motorbike(nameMotorbike: $nameMotorbike, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Motorbike &&
        other.nameMotorbike == nameMotorbike &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => nameMotorbike.hashCode ^ images.hashCode;
}
