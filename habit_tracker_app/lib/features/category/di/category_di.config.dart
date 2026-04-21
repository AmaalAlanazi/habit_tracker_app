// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/category/data/datasources/category_remote_data_source.dart'
    as _i89;
import 'package:habit_tracker_app/features/category/data/repositories/category_repository_data.dart'
    as _i203;
import 'package:habit_tracker_app/features/category/domain/repositories/category_repository_domain.dart'
    as _i941;
import 'package:habit_tracker_app/features/category/domain/use_cases/category_use_case.dart'
    as _i294;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initCategory({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i89.BaseCategoryRemoteDataSource>(
      () => _i89.CategoryRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i941.CategoryRepositoryDomain>(
      () =>
          _i203.CategoryRepositoryData(gh<_i89.BaseCategoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i294.CategoryUseCase>(
      () => _i294.CategoryUseCase(gh<_i941.CategoryRepositoryDomain>()),
    );
    return this;
  }
}
