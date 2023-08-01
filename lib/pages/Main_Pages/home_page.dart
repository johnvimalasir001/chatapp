// import 'package:chatrat/Backend/firebase/Auth/email_and_password_auth.dart';
import 'package:chatrat/fake_data/datas/data.dart';
import 'package:chatrat/pages/pages.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:chatrat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final EmailAndPasswordAuth _emailAndPasswordAuth = EmailAndPasswordAuth();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
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
            //   child: searchBox(),
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
                childCount: onlineUsers.length,
                (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatPage()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ChatCard(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
