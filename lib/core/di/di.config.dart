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
import '../../data/contracts/profile/profile_online_data_sourse.dart' as _i7;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i6;
import '../../data/datassource/profile/profile_online_data_sourse_impl.dart'
    as _i8;
import '../../data/repository/auth_repo_impl.dart' as _i10;
import '../../data/repository/profile_repo_impl.dart' as _i13;
import '../../domin/repositories/auth_repository.dart' as _i9;
import '../../domin/repositories/profile_repository.dart' as _i12;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i15;
import '../../domin/use_case/auth_use_case/get_user_info_use_case.dart' as _i14;
import '../../domin/use_case/auth_use_case/login_use_case.dart' as _i17;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart'
    as _i18;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i16;
import '../../domin/use_case/auth_use_case/verification_code_use_case.dart'
    as _i11;
import '../../domin/use_case/profile_use_case/edit_profile_use_case.dart'
    as _i21;
import '../../presentation/auth/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i20;
import '../../presentation/auth/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i25;
import '../../presentation/auth/forget_password/manager/verification_code_view_model/verification_code_view_model.dart'
    as _i24;
import '../../presentation/auth/login/login_viewmodel.dart' as _i23;
import '../../presentation/auth/signup/sign_up_viewmodel.dart' as _i19;
import '../../presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_view_model.dart'
    as _i22;
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
    gh.factory<_i7.ProfileOnlineDataSourse>(() =>
        _i8.ProfileOnlineDataSourseImpl(apiManager: gh<_i4.ApiManager>()));
    gh.factory<_i9.AuthRepository>(
        () => _i10.AuthRepoImpl(gh<_i5.AuthOnlineDatasource>()));
    gh.factory<_i11.VerificationCodeUseCase>(() =>
        _i11.VerificationCodeUseCase(authRepository: gh<_i9.AuthRepository>()));
    gh.factory<_i12.ProfileRepository>(() => _i13.ProfileRepoImpl(
        profileOnlineDataSourse: gh<_i7.ProfileOnlineDataSourse>()));
    gh.factory<_i14.GetUserInfoUseCase>(() => _i14.GetUserInfoUseCase(
        profileRepository: gh<_i12.ProfileRepository>()));
    gh.factory<_i15.ForgetPasswordUseCase>(
        () => _i15.ForgetPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i16.SignupUseCase>(
        () => _i16.SignupUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i17.LoginUseCase>(
        () => _i17.LoginUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i18.ResetPasswordUseCase>(
        () => _i18.ResetPasswordUseCase(gh<_i9.AuthRepository>()));
    gh.factory<_i19.SignUpViewModel>(
        () => _i19.SignUpViewModel(gh<_i16.SignupUseCase>()));
    gh.factory<_i20.ForgetPasswordViewModel>(
        () => _i20.ForgetPasswordViewModel(gh<_i15.ForgetPasswordUseCase>()));
    gh.factory<_i21.EditProfileUseCase>(
        () => _i21.EditProfileUseCase(gh<_i12.ProfileRepository>()));
    gh.factory<_i22.GetUserInfoViewMOdel>(
        () => _i22.GetUserInfoViewMOdel(gh<_i14.GetUserInfoUseCase>()));
    gh.factory<_i23.LoginViewModel>(
        () => _i23.LoginViewModel(gh<_i17.LoginUseCase>()));
    gh.factory<_i24.VerificationCodeViewModel>(
        () => _i24.VerificationCodeViewModel(
              gh<_i11.VerificationCodeUseCase>(),
              gh<_i15.ForgetPasswordUseCase>(),
            ));
    gh.factory<_i25.ResetPasswordViewModel>(
        () => _i25.ResetPasswordViewModel(gh<_i18.ResetPasswordUseCase>()));
    return this;
  }
}
