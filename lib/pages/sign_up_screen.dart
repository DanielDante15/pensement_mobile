import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:pensement_mobile/components/Button/button.dart';
import 'package:pensement_mobile/components/Button/link_button.dart';
import 'package:pensement_mobile/components/TextField/textfield.dart';
import 'package:pensement_mobile/contexts/UserContext.dart';
import 'package:pensement_mobile/validators/password_validator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final nuvigator = Nuvigator.of(context);
    final UserContext instance = UserContext();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(height: 20),
                    BTextField(
                      controller: nameController,
                      title: 'Name',
                    ),
                    BTextField(
                      controller: emailController,
                      title: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    BTextField(
                      validator: (p0) => passwordValidator(p0),
                      controller: passwordController,
                      title: 'Password',
                      isObscure: true,
                    ),
                    BTextField(
                      controller: confirmPasswordController,
                      validator: (p0) {
                        if (p0 != passwordController.text) {
                          return 'Password must be equal';
                        }
                        return null;
                      },
                      title: 'Confirm Password',
                      isObscure: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BLinkButton(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w400,
                            text: "I Already have an account",
                            color: Colors.black,
                            fontSize: 14,
                            onTap: () =>
                                {nuvigator!.pushReplacementNamed('login')},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ListenableBuilder(
                        listenable: instance,
                        builder: (context, child) {
                          if (instance.isLoading) {
                            return const CircularProgressIndicator();
                          }
                          return BButton(
                            onPress: () async {
                              if (formkey.currentState!.validate()) {
                                bool isLoged = await instance.registerUser(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text);
                                if (isLoged) {
                                  nuvigator!.open('login');
                                }
                                nameController.clear();
                                emailController.clear();
                                passwordController.clear();
                                confirmPasswordController.clear();
                              }
                            },
                            text: 'Sign up',
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
