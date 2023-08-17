import 'package:chatrat/Backend/Sql_management/local_database_management.dart';
import 'package:chatrat/Backend/firebase/OnlineDatabaseManagement/cloud_data_management.dart';
import 'package:chatrat/Global/globals.dart';
import 'package:chatrat/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CloudStoreDataManagement _cloudStoreDataManagement =
      CloudStoreDataManagement();

  final LocalDatabase _localDatabase = LocalDatabase();

  static final FirestoreFieldConstants _firestoreFieldConstants =
      FirestoreFieldConstants();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 5,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 8,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width / 10,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            alignment: Alignment.center,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
