import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesisv1/src/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future < FirebaseApp > _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder:(context, snapshot){
        //revision de errores
        if (snapshot.hasError) {
          print("Sometime went wrong");
        }
        if(snapshot.connectionState==ConnectionState.done){
          return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: 'welcome',
      theme: ThemeData(
        accentColor: Color.fromRGBO(225, 140, 0, 1.0),
        primaryColor: Color.fromRGBO(10, 31, 68, 1.0),
        buttonColor: Color.fromRGBO(0, 122, 255, 1.0),
        disabledColor: Color.fromRGBO(142, 142, 147,1.2),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.yellow[800])
        )
      ),
    );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
