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

import '../../data/repositories/auth_repository.dart' as _i481;
import '../../data/repositories/bengkel_repository.dart' as _i794;
import '../../data/repositories/vehicle_repository.dart' as _i783;
import '../../features/auth/cubit/auth_cubit.dart' as _i698;
import '../../features/auth/data/mock_auth_repository.dart' as _i351;
import '../../features/bengkel/cubit/bengkel_cubit.dart' as _i78;
import '../../features/bengkel/data/mock_bengkel_repository.dart' as _i796;
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
    gh.lazySingleton<_i794.BengkelRepository>(
      () => _i796.MockBengkelRepository(),
    );
    gh.lazySingleton<_i783.VehicleRepository>(
      () => _i843.MonitoringRepository(),
    );
    gh.lazySingleton<_i481.AuthRepository>(() => _i351.MockAuthRepository());
    gh.factory<_i78.BengkelCubit>(
      () => _i78.BengkelCubit(gh<_i794.BengkelRepository>()),
    );
    gh.factory<_i150.MonitoringBloc>(
      () => _i150.MonitoringBloc(gh<_i783.VehicleRepository>()),
    );
    gh.factory<_i698.AuthCubit>(
      () => _i698.AuthCubit(gh<_i481.AuthRepository>()),
    );
    return this;
  }
}

class _$RouterModule extends _i553.RouterModule {}
