// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/bottom_bar/data/datasources/bottom_bar_remote_data_source.dart'
    as _i1;
import 'package:habit_tracker_app/features/bottom_bar/data/repositories/bottom_bar_repository_data.dart'
    as _i168;
import 'package:habit_tracker_app/features/bottom_bar/domain/repositories/bottom_bar_repository_domain.dart'
    as _i356;
import 'package:habit_tracker_app/features/bottom_bar/domain/use_cases/bottom_bar_use_case.dart'
    as _i842;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initBottomBar({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1.BaseBottomBarRemoteDataSource>(
      () => _i1.BottomBarRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i356.BottomBarRepositoryDomain>(
      () => _i168.BottomBarRepositoryData(
        gh<_i1.BaseBottomBarRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i842.BottomBarUseCase>(
      () => _i842.BottomBarUseCase(gh<_i356.BottomBarRepositoryDomain>()),
    );
    return this;
  }
}
