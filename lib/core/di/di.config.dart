// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_manager.dart' as _i3;
import '../../data/contracts/auth/auth_offline_datasource.dart' as _i6;
import '../../data/contracts/auth/auth_online_datasource.dart' as _i4;
import '../../data/datassource/auth/auth_offline-datasource_impl.dart' as _i7;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i5;
import '../../data/repository/auth_repo_impl.dart' as _i9;
import '../../domin/repositories/auth_repository.dart' as _i8;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i10;
import '../../domin/use_case/auth_use_case/reset_code_use_case.dart' as _i15;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart'
    as _i12;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i11;
import '../../presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i14;
import '../../presentation/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i17;
import '../../presentation/forget_password/manager/rest_code_view_model/reset_code_view_model.dart'
    as _i16;
import '../../presentation/signup/sign_up_viewmodel.dart' as _i13;

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
    gh.lazySingleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.AuthOnlineDatasource>(
        () => _i5.AuthOnlineDatasourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthOfflineDatasource>(
        () => _i7.AuthOfflineDatasourceImpl());
    gh.factory<_i8.AuthRepository>(() => _i9.AuthRepoImpl(
          gh<_i4.AuthOnlineDatasource>(),
          gh<_i4.AuthOnlineDatasource>(),
        ));
    gh.factory<_i10.ForgetPasswordUseCase>(
        () => _i10.ForgetPasswordUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i11.SignupUseCase>(
        () => _i11.SignupUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i12.ResetPasswordUseCase>(
        () => _i12.ResetPasswordUseCase(gh<_i8.AuthRepository>()));
    gh.factory<_i13.SignUpViewModel>(
        () => _i13.SignUpViewModel(gh<_i11.SignupUseCase>()));
    gh.factory<_i14.ForgetPasswordViewModel>(
        () => _i14.ForgetPasswordViewModel(gh<_i10.ForgetPasswordUseCase>()));
    gh.factory<_i15.ResetCodeUseCase>(
        () => _i15.ResetCodeUseCase(authRepository: gh<_i8.AuthRepository>()));
    gh.factory<_i16.ResetCodeViewModel>(
        () => _i16.ResetCodeViewModel(gh<_i15.ResetCodeUseCase>()));
    gh.factory<_i17.ResetPasswordViewModel>(
        () => _i17.ResetPasswordViewModel(gh<_i12.ResetPasswordUseCase>()));
    return this;
  }
}
