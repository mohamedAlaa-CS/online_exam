// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_manager.dart' as _i4;
import '../../data/contracts/auth/auth_offline_datasource.dart' as _i7;
import '../../data/contracts/auth/auth_online_datasource.dart' as _i5;
import '../../data/datasource/auth/auth_offline_datasource_impl.dart' as _i8;
import '../../data/datasource/auth/auth_online_datasource_impl.dart' as _i6;
import '../../data/repositories/auth_repositories.impl.dart' as _i10;
import '../../domin/repositories/auth_repository.dart' as _i9;
import '../../domin/use_cases/login_use_case.dart' as _i11;
import '../../presentation/login/login_viewmodel.dart' as _i12;
import '../cache/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.SharedPreferencesHelper>(
        () => _i3.SharedPreferencesHelper());
    gh.lazySingleton<_i4.ApiManager>(() => _i4.ApiManager());
    gh.factory<_i5.AuthOnlineDatasource>(
        () => _i6.AuthOnlineDatasourceImpl(gh<_i4.ApiManager>()));
    gh.factory<_i7.AuthOfflineDatasource>(() => _i8.AuthOflineDatasourceImpl());
    gh.factory<_i9.AuthRepository>(() => _i10.AuthRepoImpl(
          gh<_i5.AuthOnlineDatasource>(),
          gh<_i7.AuthOfflineDatasource>(),
        ));
    gh.factory<_i11.LoginUseCase>(
        () => _i11.LoginUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i12.LoginViewModel>(
        () => _i12.LoginViewModel(gh<_i11.LoginUseCase>()));
    return this;
  }
}
