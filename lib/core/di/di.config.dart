// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api_manager.dart' as _i442;
import '../../data/contracts/auth/auth_offline_datasource.dart' as _i451;
import '../../data/contracts/auth/auth_online_datasource.dart' as _i386;
import '../../data/datassource/auth/auth_offline-datasource_impl.dart' as _i267;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i2;
import '../../data/repository/auth_repo_impl.dart' as _i372;
import '../../domin/repositories/auth_repository.dart' as _i902;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i2;
import '../../domin/use_case/auth_use_case/login_use_case.dart' as _i490;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart' as _i2;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i303;
import '../../domin/use_case/auth_use_case/verification_code_use_case.dart'
    as _i877;
import '../../presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i668;
import '../../presentation/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i56;
import '../../presentation/forget_password/manager/verification_code_view_model/verification_code_view_model.dart'
    as _i298;
import '../../presentation/login/login_viewmodel.dart' as _i351;
import '../../presentation/signup/sign_up_viewmodel.dart' as _i1038;
import '../cache/shared_preferences.dart' as _i254;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i254.SharedPreferencesHelper>(
        () => _i254.SharedPreferencesHelper());
    gh.lazySingleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.factory<_i386.AuthOnlineDatasource>(
        () => _i2.AuthOnlineDatasourceImpl(gh<_i442.ApiManager>()));
    gh.factory<_i451.AuthOfflineDatasource>(
        () => _i267.AuthOfflineDatasourceImpl());
    gh.factory<_i902.AuthRepository>(() => _i372.AuthRepoImpl(
          gh<_i386.AuthOnlineDatasource>(),
          gh<_i451.AuthOfflineDatasource>(),
        ));
    gh.factory<_i2.ForgetPasswordUseCase>(
        () => _i2.ForgetPasswordUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i490.LoginUseCase>(
        () => _i490.LoginUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i2.ResetPasswordUseCase>(
        () => _i2.ResetPasswordUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i303.SignupUseCase>(
        () => _i303.SignupUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i1038.SignUpViewModel>(
        () => _i1038.SignUpViewModel(gh<_i303.SignupUseCase>()));
    gh.factory<_i668.ForgetPasswordViewModel>(
        () => _i668.ForgetPasswordViewModel(gh<_i2.ForgetPasswordUseCase>()));
    gh.factory<_i877.VerificationCodeUseCase>(() =>
        _i877.VerificationCodeUseCase(
            authRepository: gh<_i902.AuthRepository>()));
    gh.factory<_i351.LoginViewModel>(
        () => _i351.LoginViewModel(gh<_i490.LoginUseCase>()));
    gh.factory<_i298.VerificationCodeViewModel>(
        () => _i298.VerificationCodeViewModel(
              gh<_i877.VerificationCodeUseCase>(),
              gh<_i2.ForgetPasswordUseCase>(),
            ));
    gh.factory<_i56.ResetPasswordViewModel>(
        () => _i56.ResetPasswordViewModel(gh<_i2.ResetPasswordUseCase>()));
    return this;
  }
}
