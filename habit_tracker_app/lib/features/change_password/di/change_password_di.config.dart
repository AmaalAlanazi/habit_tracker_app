// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/change_password/data/datasources/change_password_remote_data_source.dart'
    as _i785;
import 'package:habit_tracker_app/features/change_password/data/repositories/change_password_repository_data.dart'
    as _i997;
import 'package:habit_tracker_app/features/change_password/domain/repositories/change_password_repository_domain.dart'
    as _i729;
import 'package:habit_tracker_app/features/change_password/domain/use_cases/change_password_use_case.dart'
    as _i253;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initChangePassword({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i785.BaseChangePasswordRemoteDataSource>(
      () => _i785.ChangePasswordRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i729.ChangePasswordRepositoryDomain>(
      () => _i997.ChangePasswordRepositoryData(
        gh<_i785.BaseChangePasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i253.ChangePasswordUseCase>(
      () => _i253.ChangePasswordUseCase(
        gh<_i729.ChangePasswordRepositoryDomain>(),
      ),
    );
    return this;
  }
}
