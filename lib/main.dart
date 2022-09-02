import 'package:flutter/material.dart';
import 'package:oshiten_app/conditionsSort.dart';
import 'package:oshiten_app/firebase_options.dart';
import 'searchDetail.dart';
import 'package:provider/provider.dart';
import 'logIn.dart';
import 'userRegister.dart';
import 'search.dart';
import 'oshimatiDetail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'myBottomNavigationBar.dart';
import 'home.dart';
import 'conditionsSort.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchProvider()),
          ChangeNotifierProvider(create: (_) => SortProvider()),
          ChangeNotifierProvider(create: (_) => BestOshiten()),
          ChangeNotifierProvider(create: (_) => currentPicIndex()),
        ],
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oshiten App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'oshiten',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isSignedIn = false;
  String userId = '';

  void checkSignInState(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user == null) {
        setState(() {
          _isSignedIn = false;
        });
      } else {
        setState(() {
          userId = user.uid;
          _isSignedIn = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkSignInState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSignedIn?MyBottomNavigationBar(selectedIndex: 3):Home(),
    );
  }
}
