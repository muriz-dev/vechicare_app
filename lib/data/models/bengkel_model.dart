class BengkelModel {
  final String id;
  final String name;
  final String city;
  final String address;
  final double rating;
  final int reviewCount;
  final List<String> specialties;
  final String openHours;
  final String imageUrl;

  const BengkelModel({
    required this.id,
    required this.name,
    required this.city,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.specialties,
    required this.openHours,
    required this.imageUrl,
  });

  factory BengkelModel.fromJson(Map<String, dynamic> json) {
    return BengkelModel(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
      specialties: (json['specialties'] as List<dynamic>).cast<String>(),
      openHours: json['openHours'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'address': address,
      'rating': rating,
      'reviewCount': reviewCount,
      'specialties': specialties,
      'openHours': openHours,
      'imageUrl': imageUrl,
    };
  }

  BengkelModel copyWith({
    String? id,
    String? name,
    String? city,
    String? address,
    double? rating,
    int? reviewCount,
    List<String>? specialties,
    String? openHours,
    String? imageUrl,
  }) {
    return BengkelModel(
      id: id ?? this.id,
      name: name ?? this.name,
      city: city ?? this.city,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      specialties: specialties ?? this.specialties,
      openHours: openHours ?? this.openHours,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  String get ratingDisplay => rating.toStringAsFixed(1);

  String get specialtiesDisplay => specialties.join(', ');
}
