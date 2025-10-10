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
import '../../data/contracts/auth/auth_online_datasource.dart' as _i386;
import '../../data/contracts/exam/exam_online_data_source.dart' as _i491;
import '../../data/contracts/explor/subject_online_data_source.dart' as _i782;
import '../../data/contracts/profile/profile_online_data_sourse.dart' as _i433;
import '../../data/contracts/questions/question_online_data_source.dart'
    as _i902;
import '../../data/datassource/auth/auth_online_datasource_impl.dart' as _i2;
import '../../data/datassource/exam/exam_online_data_source_impl.dart' as _i967;
import '../../data/datassource/explor/subject_online_data_source_imple.dart'
    as _i385;
import '../../data/datassource/profile/profile_online_data_sourse_impl.dart'
    as _i963;
import '../../data/datassource/questions/questions_online_data_sourse_impl.dart'
    as _i624;
import '../../data/repository/auth_repo_impl.dart' as _i372;
import '../../data/repository/exam_repo_impl.dart' as _i73;
import '../../data/repository/profile_repo_impl.dart' as _i835;
import '../../data/repository/question_repo_impl.dart' as _i457;
import '../../data/repository/subject_repo_impl.dart' as _i218;
import '../../domin/repositories/auth_repository.dart' as _i902;
import '../../domin/repositories/exam_repository.dart' as _i862;
import '../../domin/repositories/profile_repository.dart' as _i991;
import '../../domin/repositories/questions_reository.dart' as _i566;
import '../../domin/repositories/subject_repository.dart' as _i721;
import '../../domin/use_case/auth_use_case/forget_password_use_case.dart'
    as _i2;
import '../../domin/use_case/auth_use_case/get_user_info_use_case.dart'
    as _i386;
import '../../domin/use_case/auth_use_case/login_use_case.dart' as _i490;
import '../../domin/use_case/auth_use_case/reset_password_use_case.dart' as _i2;
import '../../domin/use_case/auth_use_case/sign_up_use_case.dart' as _i303;
import '../../domin/use_case/auth_use_case/verification_code_use_case.dart'
    as _i877;
import '../../domin/use_case/exam_use_case.dart' as _i439;
import '../../domin/use_case/explor/get_all_subject_use_case.dart' as _i782;
import '../../domin/use_case/profile_use_case/change_password_use_case.dart'
    as _i120;
import '../../domin/use_case/profile_use_case/edit_profile_use_case.dart'
    as _i987;
import '../../domin/use_case/questions_use_case.dart' as _i889;
import '../../presentation/auth/forget_password/manager/forget_password_view_model/forget_password_view_model.dart'
    as _i234;
import '../../presentation/auth/forget_password/manager/reset_password_view_model/reset_password_view_model.dart'
    as _i584;
import '../../presentation/auth/forget_password/manager/verification_code_view_model/verification_code_view_model.dart'
    as _i412;
import '../../presentation/auth/login/login_viewmodel.dart' as _i651;
import '../../presentation/auth/signup/sign_up_viewmodel.dart' as _i1056;
import '../../presentation/exam/view_model/exam_view_model.dart' as _i70;
import '../../presentation/main_layout/tabs/explore/view_models/subject_view_model.dart'
    as _i241;
import '../../presentation/main_layout/tabs/profile/manager/change_password_view_model/change_password_view_model.dart'
    as _i457;
import '../../presentation/main_layout/tabs/profile/manager/edit_profile_view_model/edit_profile_view_model.dart'
    as _i451;
import '../../presentation/main_layout/tabs/profile/manager/get_user_info_view_model/get_user_info_view_model.dart'
    as _i646;
import '../../presentation/questions/view_model/question_view_model.dart'
    as _i744;
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
    gh.factory<_i782.SubjectOnlineDataSource>(
        () => _i385.SubjectOnlineDataSourceImple(gh<_i442.ApiManager>()));
    gh.factory<_i491.ExamOnlineDataSource>(
        () => _i967.ExamOnlineDataSourceImpl(gh<_i442.ApiManager>()));
    gh.factory<_i902.QuestionOnlineDataSource>(
        () => _i624.QuestionsOnlineDataSourseImpl(gh<_i442.ApiManager>()));
    gh.factory<_i721.SubjectRepository>(
        () => _i218.SubjectRepoImpl(gh<_i782.SubjectOnlineDataSource>()));
    gh.factory<_i566.QuestionsRepository>(
        () => _i457.QuestionRepoImpl(gh<_i902.QuestionOnlineDataSource>()));
    gh.factory<_i889.QuestionsUseCase>(
        () => _i889.QuestionsUseCase(gh<_i566.QuestionsRepository>()));
    gh.factory<_i433.ProfileOnlineDataSourse>(() =>
        _i963.ProfileOnlineDataSourseImpl(apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i902.AuthRepository>(
        () => _i372.AuthRepoImpl(gh<_i386.AuthOnlineDatasource>()));
    gh.factory<_i744.QuestionViewModel>(
        () => _i744.QuestionViewModel(gh<_i889.QuestionsUseCase>()));
    gh.factory<_i862.ExamRepository>(
        () => _i73.ExamRepoImpl(gh<_i491.ExamOnlineDataSource>()));
    gh.factory<_i877.VerificationCodeUseCase>(() =>
        _i877.VerificationCodeUseCase(
            authRepository: gh<_i902.AuthRepository>()));
    gh.factory<_i991.ProfileRepository>(() => _i835.ProfileRepoImpl(
        profileOnlineDataSourse: gh<_i433.ProfileOnlineDataSourse>()));
    gh.factory<_i782.GetAllSubjectUseCase>(
        () => _i782.GetAllSubjectUseCase(gh<_i721.SubjectRepository>()));
    gh.factory<_i386.GetUserInfoUseCase>(() => _i386.GetUserInfoUseCase(
        profileRepository: gh<_i991.ProfileRepository>()));
    gh.factory<_i439.ExamUseCase>(
        () => _i439.ExamUseCase(gh<_i862.ExamRepository>()));
    gh.factory<_i2.ForgetPasswordUseCase>(
        () => _i2.ForgetPasswordUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i303.SignupUseCase>(
        () => _i303.SignupUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i490.LoginUseCase>(
        () => _i490.LoginUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i2.ResetPasswordUseCase>(
        () => _i2.ResetPasswordUseCase(gh<_i902.AuthRepository>()));
    gh.factory<_i241.SubjectViewModel>(
        () => _i241.SubjectViewModel(gh<_i782.GetAllSubjectUseCase>()));
    gh.factory<_i1056.SignUpViewModel>(
        () => _i1056.SignUpViewModel(gh<_i303.SignupUseCase>()));
    gh.factory<_i234.ForgetPasswordViewModel>(
        () => _i234.ForgetPasswordViewModel(gh<_i2.ForgetPasswordUseCase>()));
    gh.factory<_i70.ExamViewModel>(
        () => _i70.ExamViewModel(gh<_i439.ExamUseCase>()));
    gh.factory<_i120.ChangePasswordUseCase>(
        () => _i120.ChangePasswordUseCase(gh<_i991.ProfileRepository>()));
    gh.factory<_i987.EditProfileUseCase>(
        () => _i987.EditProfileUseCase(gh<_i991.ProfileRepository>()));
    gh.factory<_i646.GetUserInfoViewMOdel>(
        () => _i646.GetUserInfoViewMOdel(gh<_i386.GetUserInfoUseCase>()));
    gh.factory<_i651.LoginViewModel>(
        () => _i651.LoginViewModel(gh<_i490.LoginUseCase>()));
    gh.factory<_i457.ChangePasswordViewModel>(
        () => _i457.ChangePasswordViewModel(gh<_i120.ChangePasswordUseCase>()));
    gh.factory<_i412.VerificationCodeViewModel>(
        () => _i412.VerificationCodeViewModel(
              gh<_i877.VerificationCodeUseCase>(),
              gh<_i2.ForgetPasswordUseCase>(),
            ));
    gh.factory<_i584.ResetPasswordViewModel>(
        () => _i584.ResetPasswordViewModel(gh<_i2.ResetPasswordUseCase>()));
    gh.factory<_i451.EditProfileViewModel>(
        () => _i451.EditProfileViewModel(gh<_i987.EditProfileUseCase>()));
    return this;
  }
}
