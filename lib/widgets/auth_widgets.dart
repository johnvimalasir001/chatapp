import 'package:chatrat/pages/pages.dart';
import 'package:flutter/material.dart';

Widget commonTextFormField({required String hintText}) {
  return Container(
    padding: const EdgeInsets.only(
      left: 40,
      right: 40,
      bottom: 40,
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
    ),
  );
}

Widget signUpButton(BuildContext context, String buttonName) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      minimumSize: Size(MediaQuery.of(context).size.width - 60, 30.0),
      backgroundColor: const Color.fromRGBO(57, 60, 80, 1),
      elevation: 5.0,
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 7.0,
        bottom: 7.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    ),
    child: Text(
      buttonName,
      style: const TextStyle(
        fontSize: 25.0,
        letterSpacing: 1.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget socialMediaIntegrationButtons() {
  return Container(
    padding: const EdgeInsets.only(
      left: 20,
      right: 20,
      top: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/google.png', width: 60),
        const SizedBox(
          width: 80,
        ),
        Image.asset('assets/images/fbook.png', width: 60),
      ],
    ),
  );
}

Widget landingPageButton(BuildContext context, String buttonName) {
  return ElevatedButton(
    onPressed: () {
      if (buttonName == 'Sign Up') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    },
    style: ElevatedButton.styleFrom(
      minimumSize: Size(MediaQuery.of(context).size.width - 250, 50),
      backgroundColor: const Color.fromRGBO(57, 60, 80, 1),
      elevation: 5.0,
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 7.0,
        bottom: 7.0,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    ),
    child: Text(
      buttonName,
      style: const TextStyle(
        fontSize: 25.0,
        letterSpacing: 1.0,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget switchAnotherAuthPage(
    BuildContext context, String buttonNameFirst, String buttonNameLast) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          buttonNameFirst,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            if (buttonNameLast == "Login") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpPage(),
                ),
              );
            }
          },
          child: Text(
            buttonNameLast,
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 16.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ],
    ),
  );
}
