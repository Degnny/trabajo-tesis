import 'dart:ui';

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage(
                  'assets/fondo.png'
                ) 
              )
            ),
            child: BackdropFilter(
              filter:ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ), 
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: Image(
                  image: AssetImage('assets/logo-indelat.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'DISEÑA FABRICA Y ASISTE AL SECTOR MINERO',
                   style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0
                  ),  
                ),
              ),
              
              Container(
                width: 350,
                height: 45.0,
                child: RaisedButton(
                  onPressed:(){
                    Navigator.pushNamed(context,'loginPage');
                  } ,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(200)
                  ),
                  color: Theme.of(context).accentColor,
                  child: Text('Iniciar Sesion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),
                  ),
                ),
              )
            ],
          )
        ]
      )
    );
  }
}