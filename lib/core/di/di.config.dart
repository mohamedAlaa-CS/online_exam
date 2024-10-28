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
import '../../data/contracts/auth/auth_online_datasource.dart' as _i5;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i6;
import '../../data/repository/auth_repo_impl.dart' as _i8;
import '../../domin/repositories/auth_repository.dart' as _i7;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i11;
import '../../domin/use_case/auth_use_case/get_user_info_use_case.dart' as _i9;
import '../../domin/use_case/auth_use_case/login_use_case.dart' as _i13;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart'
    as _i14;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i12;
import '../../domin/use_case/auth_use_case/verification_code_use_case.dart'
    as _i10;
import '../../presentation/auth/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i16;
import '../../presentation/auth/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i19;
import '../../presentation/auth/forget_password/manager/verification_code_view_model/verification_code_view_model.dart'
    as _i18;
import '../../presentation/auth/login/login_viewmodel.dart' as _i17;
import '../../presentation/auth/signup/sign_up_viewmodel.dart' as _i15;
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
    gh.factory<_i7.AuthRepository>(
        () => _i8.AuthRepoImpl(gh<_i5.AuthOnlineDatasource>()));
    gh.factory<_i9.GetUserInfoUseCase>(
        () => _i9.GetUserInfoUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.factory<_i10.VerificationCodeUseCase>(() =>
        _i10.VerificationCodeUseCase(authRepository: gh<_i7.AuthRepository>()));
    gh.factory<_i11.ForgetPasswordUseCase>(
        () => _i11.ForgetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i12.SignupUseCase>(
        () => _i12.SignupUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i14.ResetPasswordUseCase>(
        () => _i14.ResetPasswordUseCase(gh<_i7.AuthRepository>()));
    gh.factory<_i15.SignUpViewModel>(
        () => _i15.SignUpViewModel(gh<_i12.SignupUseCase>()));
    gh.factory<_i16.ForgetPasswordViewModel>(
        () => _i16.ForgetPasswordViewModel(gh<_i11.ForgetPasswordUseCase>()));
    gh.factory<_i17.LoginViewModel>(
        () => _i17.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i18.VerificationCodeViewModel>(
        () => _i18.VerificationCodeViewModel(
              gh<_i10.VerificationCodeUseCase>(),
              gh<_i11.ForgetPasswordUseCase>(),
            ));
    gh.factory<_i19.ResetPasswordViewModel>(
        () => _i19.ResetPasswordViewModel(gh<_i14.ResetPasswordUseCase>()));
    return this;
  }
}
