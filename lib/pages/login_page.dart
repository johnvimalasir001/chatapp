import 'package:chatrat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 48, 60, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _signUpKey,
                  child: Column(
                    children: [
                      commonTextFormField(hintText: "Email"),
                      commonTextFormField(hintText: "Password"),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, bottom: 20),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.lightBlueAccent,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      signUpButton(context, 'Login'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Or Continue with",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              socialMediaIntegrationButtons(),
              const SizedBox(height: 10),
              switchAnotherAuthPage(
                  context, "Don't Have an Account? ", 'Sign-Up')
            ],
          ),
        ),
      ),
    );
  }
}
