import 'package:pensement_mobile/components/Button/button.dart';
import 'package:pensement_mobile/components/Button/link_button.dart';
import 'package:pensement_mobile/components/TextField/textfield.dart';
import 'package:pensement_mobile/contexts/AuthContext.dart';
import 'package:pensement_mobile/validators/email_validator.dart';
import 'package:pensement_mobile/validators/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordControler = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final instance = AuthContext.service;
    final nuvigator = Nuvigator.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      instance.validateToken();
      if (instance.isAuth) {
        nuvigator!.pushReplacementNamed('home');
      }
    });

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 50, left: 20, right: 20),
                  child: Text(
                    'Pensement',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BTextField(
                        title: 'Email',
                        validator: (value) => emailValidator(value),
                        keyboardType: TextInputType.emailAddress,
                        controller: usernameController,
                        hintText: 'Insert your email',
                      ),
                      BTextField(
                        title: 'Password',
                        validator: (value) => passwordValidator(value),
                        controller: passwordControler,
                        isObscure: true,
                        hintText: 'Insert your password',
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BLinkButton(
                              text: "I don't have an account",
                              color: Colors.black,
                              fontSize: 14,
                              onTap: () =>
                                  nuvigator!.pushReplacementNamed('sign-up'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: BLinkButton(
                                text: "Forgot password",
                                color: Colors.black,
                                fontSize: 14,
                                onTap: () {},
                              ),
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
                                bool isLoged = await instance.login(
                                    usernameController.text,
                                    passwordControler.text);
                                if (isLoged) {
                                  nuvigator!.open('home');
                                }
                                usernameController.clear();
                              },
                              text: 'Login',
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
