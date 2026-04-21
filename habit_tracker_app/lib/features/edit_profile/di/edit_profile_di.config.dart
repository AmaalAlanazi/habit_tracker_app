// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:habit_tracker_app/features/edit_profile/data/datasources/edit_profile_remote_data_source.dart'
    as _i419;
import 'package:habit_tracker_app/features/edit_profile/data/repositories/edit_profile_repository_data.dart'
    as _i489;
import 'package:habit_tracker_app/features/edit_profile/domain/repositories/edit_profile_repository_domain.dart'
    as _i543;
import 'package:habit_tracker_app/features/edit_profile/domain/use_cases/edit_profile_use_case.dart'
    as _i287;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initEditProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i419.BaseEditProfileRemoteDataSource>(
      () => _i419.EditProfileRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i543.EditProfileRepositoryDomain>(
      () => _i489.EditProfileRepositoryData(
        gh<_i419.BaseEditProfileRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i287.EditProfileUseCase>(
      () => _i287.EditProfileUseCase(gh<_i543.EditProfileRepositoryDomain>()),
    );
    return this;
  }
}
