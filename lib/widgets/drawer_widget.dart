import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatrat/fake_data/datas/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10.0,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: const Color.fromRGBO(34, 48, 60, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (_) => const Scaffold(
            //           backgroundColor: Colors.red,
            //         ),
            //       ),
            //     );
            //   },
            //   child: Center(
            //     child: CircleAvatar(
            //       backgroundImage:
            //           CachedNetworkImageProvider(currentUser.imageUrl),
            //       backgroundColor: Colors.white,
            //       radius: MediaQuery.of(context).orientation ==
            //               Orientation.portrait
            //           ? MediaQuery.of(context).size.height * (1.2 / 8) / 2.5
            //           : MediaQuery.of(context).size.height * (2.5 / 8) / 2.5,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 30.0,
            ),
            _menuOptions(Icons.person_outline_rounded, 'Profile'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.settings, 'Setting'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.support_outlined, 'Support'),
            const SizedBox(
              height: 10.0,
            ),
            _menuOptions(Icons.description_outlined, 'About'),
            const SizedBox(
              height: 30.0,
            ),
            exitButtonCall(),
          ],
        ),
      ),
    );
  }
}

Widget _menuOptions(IconData icon, String menuOptionIs) {
  return OpenContainer(
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: const Duration(
      milliseconds: 500,
    ),
    closedElevation: 0.0,
    openElevation: 3.0,
    closedColor: const Color.fromRGBO(34, 48, 60, 1),
    openColor: const Color.fromRGBO(34, 48, 60, 1),
    middleColor: const Color.fromRGBO(34, 48, 60, 1),
    onClosed: (value) {
      // print('Profile Page Closed');
      // if (mounted) {
      //   setState(() {
      //     ImportantThings.findImageUrlAndUserName();
      //   });
      // }
    },
    openBuilder: (context, openWidget) {
      if (menuOptionIs == 'Profile') {
        return const Scaffold(
          backgroundColor: Colors.amber,
        );
      } else if (menuOptionIs == 'Setting') {
        return const Scaffold(
          backgroundColor: Colors.blue,
        );
      } else if (menuOptionIs == 'Support') {
        return const Scaffold(
          backgroundColor: Colors.pink,
        );
      } else if (menuOptionIs == 'About') {
        return const Scaffold(
          backgroundColor: Colors.green,
        );
      }
      return const Center();
    },
    closedBuilder: (context, closeWidget) {
      return SizedBox(
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.lightBlue,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              menuOptionIs,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget exitButtonCall() {
  return GestureDetector(
    onTap: () async {
      await SystemNavigator.pop(animated: true);
    },
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.exit_to_app_rounded,
          color: Colors.lightBlue,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Exit',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}


  // Widget logOutButton() {
  //   return TextButton(
  //     onPressed: () async {
  //       print("Logging out...");
  //       final bool emailAndPasswordResponse =
  //           await _emailAndPasswordAuth.logOut();
  //       print("Logout response: $emailAndPasswordResponse");
  //       if (emailAndPasswordResponse) {
  //         print("Navigating to LoginPage...");
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const LoginPage(),
  //           ),
  //           (route) => false,
  //         );
  //       }
  //     },
  //     child: Text("Log Out"),
  //   );
  // }