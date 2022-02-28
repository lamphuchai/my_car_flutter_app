import 'dart:convert';
import 'package:flutter/foundation.dart';

class Car {
  final String nameCar;
  final List<String> images;

  Car({
    required this.nameCar,
    required this.images,
  });

  Car copyWith({
    String? nameCar,
    List<String>? images,
  }) {
    return Car(
      nameCar: nameCar ?? this.nameCar,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nameCar': nameCar,
      'images': images,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      nameCar: map['nameCar'] ?? '',
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source));

  @override
  String toString() => 'Car(nameCar: $nameCar, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.nameCar == nameCar &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => nameCar.hashCode ^ images.hashCode;
}
