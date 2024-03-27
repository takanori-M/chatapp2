import 'package:chatapp_2/helper/helper_function.dart';
import 'package:chatapp_2/pages/home_page.dart';
import 'package:chatapp_2/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
if(kIsWeb) {
  // run the initialization for web
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: Constants.apiKey,
    appId: Constants.appId,
    messagingSenderId: Constants.messagingSenderId,
    projectId: Constants.projectId));
}
else {
  // run the initialization for andoroid, ios
  await Firebase.initializeApp();
}

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isSignedIn = false;
  
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        _isSignedIn = value;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    );
  }
}