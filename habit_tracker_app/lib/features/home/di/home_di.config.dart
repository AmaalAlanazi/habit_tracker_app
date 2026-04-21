// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/home/data/datasources/home_remote_data_source.dart'
    as _i207;
import 'package:habit_tracker_app/features/home/data/repositories/home_repository_data.dart'
    as _i546;
import 'package:habit_tracker_app/features/home/domain/repositories/home_repository_domain.dart'
    as _i691;
import 'package:habit_tracker_app/features/home/domain/use_cases/home_use_case.dart'
    as _i886;
import 'package:habit_tracker_app/features/home/presentation/cubit/home_cubit.dart'
    as _i696;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i207.BaseHomeRemoteDataSource>(
      () => _i207.HomeRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i691.HomeRepositoryDomain>(
      () => _i546.HomeRepositoryData(gh<_i207.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i886.HomeUseCase>(
      () => _i886.HomeUseCase(gh<_i691.HomeRepositoryDomain>()),
    );
    gh.factory<_i696.HomeCubit>(() => _i696.HomeCubit(gh<_i886.HomeUseCase>()));
    return this;
  }
}
