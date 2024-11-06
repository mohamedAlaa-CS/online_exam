import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/domin/entities/exam.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/user.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/forget_password_view_model/forget_password_view_model.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/reset_password_view_model/reset_password_view_model.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/verification_code_view_model/verification_code_view_model.dart';
import 'package:online_exam/presentation/auth/forget_password/views/forget_password_view.dart';
import 'package:online_exam/presentation/auth/forget_password/views/reset_password_view.dart';
import 'package:online_exam/presentation/auth/forget_password/views/verification_code_view.dart';
import 'package:online_exam/presentation/auth/login/login_view.dart';
import 'package:online_exam/presentation/auth/signup/sign_up_view.dart';
import 'package:online_exam/presentation/auth/signup/sign_up_viewmodel.dart';
import 'package:online_exam/presentation/main_layout/main_layout_view.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questions_answers.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exam.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/exams_viewModel.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/exams/view/start_exam.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/change_password_view.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/edit_profile_view.dart';

class AppRouters {
  static Route? onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case Routers.homeView:
        return MaterialPageRoute(
          builder: (context) => const MainLayoutView(),
        );
      case Routers.signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignUpViewModel>(),
            child: const SignupView(),
          ),
        );
      case Routers.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordViewModel>(),
            child: const ForgetPasswordView(),
          ),
        );
      case Routers.verificationCodeView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<VerificationCodeViewModel>(),
            child: const VerificationCodeView(),
          ),
        );
      case Routers.resetPasswordView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetPasswordViewModel>(),
            child: const ResetPasswordView(),
          ),
        );

      case Routers.examsView:
        final args = settings.arguments as Map<String, dynamic>?;
        final subjectId = args?['subjectId'] as String?;
        final subjectName = args?['subjectName'] as String?;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {
              final viewModel = getIt<ExamsViewModel>();
              viewModel.subjectId = subjectId;
              viewModel.fetchExams();
              return viewModel;
            },
            child: ExamsView(subjectId: subjectId, subjectName: subjectName),
          ),
        );
      case Routers.startExamView:
        final args = settings.arguments as Map<String, dynamic>?;
        final exam = args?['exam'] as Exam;
        final subjectName = args?['subjectName'] as String;

        return MaterialPageRoute(
          builder: (context) => StartExam(
            exam: exam,
            subjectName: subjectName,
          ),
        );

      case Routers.questionsAnswers:
        final arguments = settings.arguments as Map<String, dynamic>;
        final exam = arguments['exam'] as Exam;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) {
              final viewModel = getIt<QuestionsViewModel>();
              viewModel.examId = exam.id;
              viewModel.exanName = exam.title!;
              viewModel.setDuration(1);
              viewModel.fetchQuestions();
              return viewModel;
            },
            child: QuestionsAnswers(
              exam: exam,
            ),
          ),
        );
      case Routers.editProfile:
        final args = settings.arguments as UserInfoEntity;
        return MaterialPageRoute(
          builder: (context) => EditProfileView(user: args),
        );
      case Routers.changePassword:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordView(),
        );

      default:
        return null;
    }
  }
}
