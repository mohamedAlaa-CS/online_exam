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
import '../../data/datassource/auth/auth_offline-datasource_impl.dart' as _i8;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i6;
import '../../data/repository/auth_repo_impl.dart' as _i10;
import '../../domin/repositories/auth_repository.dart' as _i9;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i11;
import '../../domin/use_case/auth_use_case/reset_code_use_case.dart' as _i16;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart'
    as _i13;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i12;
import '../../presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i15;
import '../../presentation/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i18;
import '../../presentation/forget_password/manager/rest_code_view_model/reset_code_view_model.dart'
    as _i17;
import '../../presentation/signup/sign_up_viewmodel.dart' as _i14;
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
    gh.factory<_i7.AuthOfflineDatasource>(
        () => _i8.AuthOfflineDatasourceImpl());
    gh.factory<_i9.AuthRepository>(() => _i10.AuthRepoImpl(
          gh<_i5.AuthOnlineDatasource>(),
          gh<_i5.AuthOnlineDatasource>(),
        ));
    gh.factory<_i11.ForgetPasswordUseCase>(
        () => _i11.ForgetPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i12.SignupUseCase>(
        () => _i12.SignupUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i13.ResetPasswordUseCase>(
        () => _i13.ResetPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i14.SignUpViewModel>(
        () => _i14.SignUpViewModel(gh<_i12.SignupUseCase>()));
    gh.factory<_i15.ForgetPasswordViewModel>(
        () => _i15.ForgetPasswordViewModel(gh<_i11.ForgetPasswordUseCase>()));
    gh.factory<_i16.ResetCodeUseCase>(
        () => _i16.ResetCodeUseCase(authRepository: gh<_i9.AuthRepository>()));
    gh.factory<_i17.ResetCodeViewModel>(
        () => _i17.ResetCodeViewModel(gh<_i16.ResetCodeUseCase>()));
    gh.factory<_i18.ResetPasswordViewModel>(
        () => _i18.ResetPasswordViewModel(gh<_i13.ResetPasswordUseCase>()));
    return this;
  }
}
