// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repositories/vehicle_repository.dart' as _i783;
import '../../features/monitoring/bloc/monitoring_bloc.dart' as _i150;
import '../../features/monitoring/data/monitoring_repository.dart' as _i843;
import '../routes/app_router.dart' as _i629;
import 'router_model.dart' as _i553;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final routerModule = _$RouterModule();
    gh.singleton<_i629.AppRouter>(() => routerModule.appRouter);
    gh.lazySingleton<_i783.VehicleRepository>(
      () => _i843.MonitoringRepository(),
    );
    gh.factory<_i150.MonitoringBloc>(
      () => _i150.MonitoringBloc(gh<_i783.VehicleRepository>()),
    );
    return this;
  }
}

class _$RouterModule extends _i553.RouterModule {}
