import 'package:injectable/injectable.dart';

import '../../../data/models/bengkel_model.dart';
import '../../../data/repositories/bengkel_repository.dart';

@LazySingleton(as: BengkelRepository)
class MockBengkelRepository implements BengkelRepository {
  final List<BengkelModel> _bengkels = const [
    BengkelModel(
      id: '1',
      name: 'AutoService Jakarta',
      city: 'Jakarta Selatan',
      address: 'Jl. Sudirman No. 45, Jakarta Selatan',
      rating: 4.8,
      reviewCount: 120,
      specialties: ['Mesin', 'Tune-up', 'AC'],
      openHours: '08.00 - 17.00',
      imageUrl: '',
    ),
    BengkelModel(
      id: '2',
      name: 'Bengkel Jaya',
      city: 'Tangerang',
      address: 'Jl. Merdeka No. 12, Tangerang',
      rating: 4.5,
      reviewCount: 85,
      specialties: ['Kaki-kaki', 'Rem', 'Ban'],
      openHours: '09.00 - 18.00',
      imageUrl: '',
    ),
    BengkelModel(
      id: '3',
      name: 'Speed Garage Bandung',
      city: 'Bandung',
      address: 'Jl. Dago No. 88, Bandung',
      rating: 4.9,
      reviewCount: 210,
      specialties: ['Tune-up', 'Remapping', 'Suspensi'],
      openHours: '08.00 - 19.00',
      imageUrl: '',
    ),
    BengkelModel(
      id: '4',
      name: 'OliMart Service',
      city: 'Jakarta Utara',
      address: 'Jl. Pluit Raya No. 21, Jakarta Utara',
      rating: 4.7,
      reviewCount: 64,
      specialties: ['Ganti Oli', 'Filter', 'Busi'],
      openHours: '08.00 - 16.00',
      imageUrl: '',
    ),
    BengkelModel(
      id: '5',
      name: 'Mitra Motor Serpong',
      city: 'Tangerang Selatan',
      address: 'Jl. Raya Serpong No. 7, Tangerang Selatan',
      rating: 4.6,
      reviewCount: 92,
      specialties: ['Mesin', 'Aki', 'Umum'],
      openHours: '09.00 - 17.00',
      imageUrl: '',
    ),
  ];

  @override
  Future<List<BengkelModel>> getBengkels() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return List.unmodifiable(_bengkels);
  }

  @override
  Future<BengkelModel?> getBengkel(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _bengkels.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }
}
