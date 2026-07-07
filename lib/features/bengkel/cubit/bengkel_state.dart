import '../../../data/models/bengkel_model.dart';

sealed class BengkelState {}

class BengkelInitial implements BengkelState {}

class BengkelLoading implements BengkelState {}

class BengkelLoaded implements BengkelState {
  final List<BengkelModel> bengkels;
  final List<BengkelModel> filteredBengkels;
  final String? query;

  const BengkelLoaded({
    required this.bengkels,
    required this.filteredBengkels,
    this.query,
  });

  BengkelLoaded copyWith({
    List<BengkelModel>? bengkels,
    List<BengkelModel>? filteredBengkels,
    String? query,
  }) {
    return BengkelLoaded(
      bengkels: bengkels ?? this.bengkels,
      filteredBengkels: filteredBengkels ?? this.filteredBengkels,
      query: query ?? this.query,
    );
  }
}

class BengkelError implements BengkelState {
  final String message;

  const BengkelError(this.message);
}
