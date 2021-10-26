import 'package:flutter/material.dart';
import 'package:flutter_tesisv1/widget/navBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo-indelat.png',
          width: 120,
          height: 40.0,
          ),
      ),
    //body: ListProyectPage(),
      
    );
  }
}