import 'package:flutter/material.dart';
import 'package:flutter_tesisv1/src/pages/create_proyect_page.dart';
import 'package:flutter_tesisv1/src/pages/home_page.dart';
import 'package:flutter_tesisv1/src/pages/list_proyect_page.dart';
import 'package:flutter_tesisv1/src/pages/login_page.dart';
//import 'package:flutter_tesisv1/src/pages/update_proyect.dart';
import 'package:flutter_tesisv1/src/pages/welcome_page.dart';

final routes=<String,WidgetBuilder>{
  'welcome':(BuildContext context)=>WelcomePage(),
  'loginPage':(BuildContext context)=>LoginPage(),
  'listProyect':(BuildContext context)=>ListProyectPage(),
  'createProyect':(BuildContext context)=>CreateProyectPage(),
 // 'updateProyect':(BuildContext context)=>UpdateProyectPage(id:storedocs[i]['id'])
};