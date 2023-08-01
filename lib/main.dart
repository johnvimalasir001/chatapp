import 'package:chatrat/Backend/firebase/OnlineDatabaseManagement/cloud_data_management.dart';
import 'package:chatrat/pages/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: await differentContextDecisionTake(),
    ),
  );
}

Future<Widget> differentContextDecisionTake() async {
  if (FirebaseAuth.instance.currentUser == null) {
    return const LoginPage();
  } else {
    final CloudStoreDataManagement _cloudStoreDataManagement =
        CloudStoreDataManagement();
    final bool _dataPresentResponse =
        await _cloudStoreDataManagement.userRecordPresentOrNot(
      email: FirebaseAuth.instance.currentUser!.email.toString(),
    );
    return _dataPresentResponse
        ? const HomePage()
        : const TakePrimaryUserData();
  }
}
