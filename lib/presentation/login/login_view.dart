import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Login'),
            ),
            AppTextFormField(
              labelText: 'Email',
              hintText: 'Enter you email',
              validator: (value) => Validations.validateEmail(value),
            ),
            ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    print(' valied');
                  }
                },
                child: const Text('test'))
          ],
        ),
      ),
    );
  }
}
