import 'bengkel_model.dart';

class BookingModel {
  final BengkelModel bengkel;
  final List<String> services;
  final DateTime date;
  final String time;

  const BookingModel({
    required this.bengkel,
    required this.services,
    required this.date,
    required this.time,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bengkel: BengkelModel.fromJson(json['bengkel'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>).cast<String>(),
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bengkel': bengkel.toJson(),
      'services': services,
      'date': date.toIso8601String(),
      'time': time,
    };
  }

  BookingModel copyWith({
    BengkelModel? bengkel,
    List<String>? services,
    DateTime? date,
    String? time,
  }) {
    return BookingModel(
      bengkel: bengkel ?? this.bengkel,
      services: services ?? this.services,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
