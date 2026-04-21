// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/forgot_password/data/datasources/forgot_password_remote_data_source.dart'
    as _i1013;
import 'package:habit_tracker_app/features/forgot_password/data/repositories/forgot_password_repository_data.dart'
    as _i749;
import 'package:habit_tracker_app/features/forgot_password/domain/repositories/forgot_password_repository_domain.dart'
    as _i197;
import 'package:habit_tracker_app/features/forgot_password/domain/use_cases/forgot_password_use_case.dart'
    as _i662;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initForgotPassword({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1013.BaseForgotPasswordRemoteDataSource>(
      () => _i1013.ForgotPasswordRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i197.ForgotPasswordRepositoryDomain>(
      () => _i749.ForgotPasswordRepositoryData(
        gh<_i1013.BaseForgotPasswordRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i662.ForgotPasswordUseCase>(
      () => _i662.ForgotPasswordUseCase(
        gh<_i197.ForgotPasswordRepositoryDomain>(),
      ),
    );
    return this;
  }
}
