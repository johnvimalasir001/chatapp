import 'package:chatrat/Backend/firebase/Auth/email_and_password_auth.dart';
import 'package:chatrat/pages/Auth_page/login_page.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:chatrat/widgets/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmailAndPasswordAuth _emailAndPasswordAuth = EmailAndPasswordAuth();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: _drawer(),
        backgroundColor: bgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              toolbarHeight: 80,
              elevation: 10,
              backgroundColor: appBarColor,
              title: const Text(
                "ChatRat",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 40,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.all(20),
            //     child: SizedBox(
            //       width: 200,
            //       child: TextField(
            //         decoration: InputDecoration(
            //           prefixIcon: const Icon(
            //             Icons.search,
            //             size: 30,
            //           ),
            //           border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(15),
            //           ),
            //           label: const Text(
            //             "Search for user",
            //             style: TextStyle(fontSize: 20),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[100],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: CustomStatus(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Scaffold()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              width: 210,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        "John",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "Hi How are you",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[400],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Saturday",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: sendButtonColor,
                                  ),
                                  child: const Center(
                                    child: Text("5"),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawer() {
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Scaffold(
                      backgroundColor: Colors.red,
                    ),
                  ),
                );
              },
              child: Center(
                child: CircleAvatar(
                  // backgroundImage:
                  //     const ExactAssetImage('assets/images/google.png'),
                  backgroundColor: Colors.white,
                  radius: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? MediaQuery.of(context).size.height * (1.2 / 8) / 2.5
                      : MediaQuery.of(context).size.height * (2.5 / 8) / 2.5,
                ),
              ),
            ),
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
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        color: appBarColor,
        width: 200,
        // height: 100,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            label: const Text(
              "Search for user",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
