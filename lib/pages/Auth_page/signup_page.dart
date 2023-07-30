import 'package:chatrat/Backend/firebase/Auth/email_and_password_auth.dart';
import 'package:chatrat/Global/globals.dart';
import 'package:chatrat/pages/Auth_page/login_page.dart';
import 'package:chatrat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _conformPwd = TextEditingController();

  final EmailAndPasswordAuth _emailAndPasswordAuth = EmailAndPasswordAuth();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 48, 60, 1),
        body: LoaderOverlay(
          useDefaultLoading: _isLoading,
          overlayColor: Colors.amber,
          child: SingleChildScrollView(
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
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _signUpKey,
                    child: Column(
                      children: [
                        commonTextFormField(
                            hintText: 'Email',
                            validator: (inputVal) {
                              if (!emailRegex.hasMatch(inputVal.toString())) {
                                return 'Email Format not Matching';
                              }
                              return null;
                            },
                            textEditingController: _email),
                        commonTextFormField(
                            hintText: 'Password',
                            validator: (String? inputVal) {
                              if (inputVal!.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            textEditingController: _password),
                        commonTextFormField(
                            hintText: 'Conform Password',
                            validator: (String? inputVal) {
                              if (inputVal!.length < 6) {
                                return 'Conform Password Must be at least 6 characters';
                              }
                              if (_password.text != _conformPwd.text) {
                                return 'Password and Conform Password Not Same Here';
                              }
                              return null;
                            },
                            textEditingController: _conformPwd),
                        const SizedBox(height: 20),
                        signUpAuthButton(context, 'Sign Up'),
                      ],
                    ),
                  ),
                ),
                // const Center(
                //   child: Text(
                //     "Or Continue with",
                //     style: TextStyle(fontSize: 15),
                //   ),
                // ),
                // socialMediaIntegrationButtons(),
                const SizedBox(height: 40),
                switchAnotherAuthPage(
                    context, "Already have an Account?", 'Login')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpAuthButton(BuildContext context, String buttonName) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width - 60, 30.0), backgroundColor: Color.fromRGBO(57, 60, 80, 1),
            elevation: 5.0,
            padding:const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 7.0,
              bottom: 7.0,
            ),
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )),
        child: Text(
          buttonName,
          style:const TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () async {
          if (this._signUpKey.currentState!.validate()) {
            print('Validated');

            if (mounted) {
              setState(() {
                this._isLoading = true;
              });
            }

            SystemChannels.textInput.invokeMethod('TextInput.hide');

            final EmailSignUpResults response = await this
                ._emailAndPasswordAuth
                .signUpAuth(email: this._email.text, password: _password.text);
            if (response == EmailSignUpResults.SignUpCompleted) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            } else {
              final String msg =
                  response == EmailSignUpResults.EmailAlreadyPresent
                      ? 'Email Already Present'
                      : 'Sign Up Not Completed';
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));
            }
          } else {
            print('Not Validated');
          }

          if (mounted) {
            setState(() {
              this._isLoading = false;
            });
          }
        },
      ),
    );
  }
}
