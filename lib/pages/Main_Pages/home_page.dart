// import 'package:chatrat/Backend/firebase/Auth/email_and_password_auth.dart';

import 'package:chatrat/Backend/Sql_management/local_database_management.dart';
import 'package:chatrat/Backend/firebase/OnlineDatabaseManagement/cloud_data_management.dart';
import 'package:chatrat/Global/globals.dart';

import 'package:chatrat/pages/pages.dart';
import 'package:chatrat/services/chat_screen.dart';
import 'package:chatrat/services/search_page.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:chatrat/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool _isLoading = false;
  // final List<String> _allUserConnectionActivity = ['Generation', 'Samarpan'];
  final List<String> _allConnectionsUserName = [];

  final CloudStoreDataManagement _cloudStoreDataManagement =
      CloudStoreDataManagement();

  final LocalDatabase _localDatabase = LocalDatabase();

  static final FirestoreFieldConstants _firestoreFieldConstants =
      FirestoreFieldConstants();

  /// For New Connected User Data Entry
  Future<void> _checkingForNewConnection(
      QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot,
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) async {
    // if (mounted) {
    //   setState(() {

    //   });
    // }

    final List<dynamic> _connectionRequestList =
        queryDocumentSnapshot.get(_firestoreFieldConstants.connectionRequest);

    for (var connectionRequestData in _connectionRequestList) {
      if (connectionRequestData.values.first.toString() ==
              OtherConnectionStatus.Invitation_Accepted.toString() ||
          connectionRequestData.values.first.toString() ==
              OtherConnectionStatus.Request_Accepted.toString()) {
        docs.forEach((everyDocument) async {
          if (everyDocument.id == connectionRequestData.keys.first.toString()) {
            final String _connectedUserName =
                everyDocument.get(_firestoreFieldConstants.userName);
            final String _token =
                everyDocument.get(_firestoreFieldConstants.token);
            final String _about =
                everyDocument.get(_firestoreFieldConstants.about);
            final String _accCreationDate =
                everyDocument.get(_firestoreFieldConstants.creationDate);
            final String _accCreationTime =
                everyDocument.get(_firestoreFieldConstants.creationTime);

            if (mounted) {
              setState(() {
                if (!_allConnectionsUserName.contains(_connectedUserName)) {
                  _allConnectionsUserName.add(_connectedUserName);
                }
              });
            }

            final bool _newConnectionUserNameInserted =
                await _localDatabase.insertOrUpdateDataForThisAccount(
                    userName: _connectedUserName,
                    userMail: everyDocument.id,
                    userToken: _token,
                    userAbout: _about,
                    userAccCreationDate: _accCreationDate,
                    userAccCreationTime: _accCreationTime);

            if (_newConnectionUserNameInserted) {
              await _localDatabase.createTableForEveryUser(
                  userName: _connectedUserName);
            }
          }
        });
      }
    }

    // if (mounted) {
    //   setState(() {

    //   });
    // }
  }

  /// Fetch Real Time Data From Cloud Firestore
  Future<void> _fetchRealTimeDataFromCloudStorage() async {
    final realTimeSnapshot =
        await this._cloudStoreDataManagement.fetchRealTimeDataFromFirestore();

    realTimeSnapshot!.listen((querySnapshot) {
      querySnapshot.docs.forEach((queryDocumentSnapshot) async {
        if (queryDocumentSnapshot.id ==
            FirebaseAuth.instance.currentUser!.email.toString()) {
          await _checkingForNewConnection(
              queryDocumentSnapshot, querySnapshot.docs);
        }
      });
    });
  }

  @override
  void initState() {
    _fetchRealTimeDataFromCloudStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _externalConnectionManagement(),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    child: CircleAvatar(),
                  ),
                ),
              ],
            ),
            // SliverToBoxAdapter(
            //   child: searchBox(),
            // ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Status",
            //           style: TextStyle(
            //             fontSize: 20,
            //             color: Colors.grey[100],
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //         TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             "See all",
            //             style: TextStyle(
            //               color: Colors.grey[400],
            //               fontSize: 15,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SliverToBoxAdapter(
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 5),
            //     child: CustomStatus(),
            //   ),
            // ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: _allConnectionsUserName.length,
                (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          userName: _allConnectionsUserName[index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: chatTileContainer(
                      context,
                      index,
                      _allConnectionsUserName[index],
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

  Widget _connectionList(BuildContext context) {
    return Container(
      child: ReorderableListView.builder(
        onReorder: (first, last) {
          // if (mounted) {
          //   setState(() {
          //     final String _draggableConnection =
          //     this._allConnectionsUserName.removeAt(first);
          //
          //     this._allConnectionsUserName.insert(
          //         last >= this._allConnectionsUserName.length
          //             ? this._allConnectionsUserName.length
          //             : last > first
          //             ? --last
          //             : last,
          //         _draggableConnection);
          //   });
          // }
        },
        itemCount: _allConnectionsUserName.length,
        itemBuilder: (context, position) {
          return chatTileContainer(
              context, position, _allConnectionsUserName[position]);
        },
      ),
    );
  }

  Widget chatTileContainer(BuildContext context, int index, String _userName) {
    return Padding(
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
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _userName,
                        style: const TextStyle(
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
    );
  }

  Widget _externalConnectionManagement() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: appBarColor,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
