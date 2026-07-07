import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/repositories/bengkel_repository.dart';
import 'bengkel_state.dart';

@Injectable()
class BengkelCubit extends Cubit<BengkelState> {
  final BengkelRepository _repository;

  BengkelCubit(this._repository) : super(BengkelInitial());

  Future<void> fetchBengkels() async {
    emit(BengkelLoading());

    try {
      final bengkels = await _repository.getBengkels();
      emit(BengkelLoaded(
        bengkels: bengkels,
        filteredBengkels: bengkels,
      ));
    } catch (e) {
      emit(BengkelError(e.toString()));
    }
  }

  void search(String query) {
    if (state is! BengkelLoaded) return;

    final current = state as BengkelLoaded;
    final normalized = query.toLowerCase();

    final filtered = current.bengkels.where((b) {
      return b.name.toLowerCase().contains(normalized) ||
          b.city.toLowerCase().contains(normalized) ||
          b.specialties.any((s) => s.toLowerCase().contains(normalized));
    }).toList();

    emit(current.copyWith(filteredBengkels: filtered, query: query));
  }

  void clearSearch() {
    if (state is! BengkelLoaded) return;

    final current = state as BengkelLoaded;
    emit(current.copyWith(filteredBengkels: current.bengkels, query: null));
  }
}
