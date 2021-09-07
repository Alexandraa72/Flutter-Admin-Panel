import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/routes.dart';
import 'package:admin/screens/auth/authentication.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDer5hbG94LYiLN7wKodKQDN6sA8uG6nTw",
        authDomain: "socialapp-ab211.firebaseapp.com",
        // databaseURL: "https://socialapp-ab211-default-rtdb.firebaseio.com",
        projectId: "socialapp-ab211",
        storageBucket: "socialapp-ab211.appspot.com",
        messagingSenderId: "140667116724",
        appId: "1:140667116724:web:2fbb51edf0d1e1c5770be1",
        measurementId: "G-5YJTPNH4VG"),
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Admin Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: AuthenticationPage(),
      ),
    );
  }
}
