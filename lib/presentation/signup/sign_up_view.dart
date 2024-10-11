import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/presentation/signup/widgets/already_have_account_and_login_button.dart';
import 'package:online_exam/presentation/signup/widgets/sign_up_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    //  SignUpViewModel signupViewModel = getIt.get<SignUpViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SignUpForm(),
                verticalSpace(48),
                AppButton(
                  text: 'Signup',
                  onPressed: () {},
                ),
                verticalSpace(16),
                const AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// Center(
//         child: BlocProvider<SignUpViewModel>(
//           create: (context) => signupViewModel,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               BlocListener<SignUpViewModel, SignupViewState>(
//                 listenWhen: (previous, current) =>
//                     current is SignupLoadingState ||
//                     current is SignupErrorState ||
//                     current is SignupSuccessState,
//                 listener: (context, state) {
//                   if (state is SignupLoadingState) {
//                     const CircularProgressIndicator();
//                   } else if (state is SignupErrorState) {
//                     showErrorDialog(context, state.exception.toString());
//                   } else if (state is SignupSuccessState) {
//                     showSuccessDialog(context);
//                   }
//                 },
//                 child: ElevatedButton(
//                   onPressed: () {
//                     signupViewModel.signup(SignupIntent(
//                       username: 'alaaAbdo',
//                       firstName: 'abdo',
//                       lastName: 'abdo',
//                       email: 'alaaaalaa@gmail.com',
//                       password: 'Ee3000##',
//                       rePassword: 'Ee3000##',
//                       phone: '01026489269',
//                     ));
//                   },
//                   child: const Text('signup'),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),