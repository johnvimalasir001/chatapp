import 'package:chatrat/Backend/firebase/Auth/email_and_password_auth.dart';
import 'package:chatrat/Global/globals.dart';
import 'package:chatrat/pages/Main%20Pages/main_screen.dart';
import 'package:chatrat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _logInKey = GlobalKey<FormState>();

  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _password = TextEditingController();

  final EmailAndPasswordAuth _emailAndPasswordAuth = EmailAndPasswordAuth();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(34, 48, 60, 1),
        body: SingleChildScrollView(
          child: LoaderOverlay(
            useDefaultLoading: _isLoading,
            overlayColor: Colors.pink,
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
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _logInKey,
                    child: Column(
                      children: [
                        commonTextFormField(
                            hintText: 'Email',
                            validator: (String? inputVal) {
                              if (!emailRegex.hasMatch(inputVal.toString())) {
                                return 'Email format is not matching';
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
                        const SizedBox(height: 20),
                        logInAuthButton(context, 'Login'),
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
                    context, "Don't Have an Account? ", 'Sign-Up')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logInAuthButton(BuildContext context, String buttonName) {
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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            )),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 25.0,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () async {
          if (_logInKey.currentState!.validate()) {
            print('Validated');
            SystemChannels.textInput.invokeMethod('TextInput.hide');

            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }

            final EmailSignInResults emailSignInResults =
                await _emailAndPasswordAuth.signInWithEmailAndPassword(
                    email: this._email.text, password: this._password.text);

            String msg = '';
            if (emailSignInResults == EmailSignInResults.SignInCompleted)
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => MainScreen()),
                  (route) => false);
            else if (emailSignInResults ==
                EmailSignInResults.EmailNotVerified) {
              msg =
                  'Email not Verified.\nPlease Verify your email and then Log In';
            } else if (emailSignInResults ==
                EmailSignInResults.EmailOrPasswordInvalid)
              msg = 'Email And Password Invalid';
            else
              msg = 'Sign In Not Completed';

            if (msg != '')
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));

            if (mounted) {
              setState(() {
                this._isLoading = false;
              });
            }
          } else {
            print('Not Validated');
          }
        },
      ),
    );
  }
}
