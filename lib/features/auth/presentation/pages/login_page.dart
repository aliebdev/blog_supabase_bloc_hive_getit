import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/widgets/loader.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/app_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_gradient_button.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (_) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              AppSnackbar.showSnackabar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in.",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    hintText: "Email",
                    onSaved: (value) => email = value ?? "",
                  ),
                  const SizedBox(height: 15),
                  AuthField(
                    hintText: "Password",
                    obscureText: true,
                    onSaved: (value) => password = value ?? "",
                  ),
                  const SizedBox(height: 20),
                  AuthGradientButton(
                    text: "Sign in",
                    onTap: () {
                      if (!formKey.currentState!.validate()) return;
                      formKey.currentState!.save();

                      context.read<AuthBloc>().add(
                            AuthLogin(
                              email: email,
                              password: password,
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      SignUpPage.route(),
                    ),
                    child: Text.rich(
                      TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                              text: "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
