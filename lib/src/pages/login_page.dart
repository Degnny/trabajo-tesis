import 'package:flutter/material.dart';
import 'package:flutter_tesisv1/widget/navBar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/logo-indelat.png',
          width: 120,
          height: 40.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  width:double.infinity,
                  height: 200,
                  fit:BoxFit.cover,
                  image: AssetImage(
                    'assets/img-tubo.jpg',
                  )
                )
              ],
            ),
            Transform.translate(
              offset: Offset(0.0, -20.0),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:EdgeInsets.all(5.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Bienvenido de nuevo',
                          style: TextStyle(
                            color:Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),
                        ),
                        Text('Iniciar sesion con tu cuenta',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0
                          ),
                        ),
                        _emailInput(),
                        _passwordInput(),
                        _buttonLogin(context)
                      ],
                    ),
                  ), 
                ),
              ), 
            )
          ],
        ),
      )
    );
  }
}

Widget _emailInput(){
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color:Color.fromRGBO(142, 142, 147, 1.0),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _passwordInput(){
  return Container(
    margin: EdgeInsets.only(top: 20.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color:Color.fromRGBO(142, 142, 147, 1.0),
      borderRadius: BorderRadius.circular(20.0)
    ),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}

Widget _buttonLogin(BuildContext context){
  return Container(
    width: 350.0,
    height: 45.0,
    margin: EdgeInsets.only(top: 20.0),
    child: RaisedButton(
      onPressed: (){
        Navigator.pushNamed(context,'listProyect');
      },
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(20.0)
      ),
      color: Theme.of(context).accentColor,
      child: Text(
        'Ingresar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17.0
        ),
      ),
    ),
  );
}