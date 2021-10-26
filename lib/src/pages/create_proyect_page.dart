import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateProyectPage extends StatefulWidget {
  const CreateProyectPage({Key? key}) : super(key: key);

  @override
  _CreateProyectPageState createState() => _CreateProyectPageState();
}

class _CreateProyectPageState extends State<CreateProyectPage> {
  final _formkey = GlobalKey<FormState>();

    var operacion="";
    var cliente = "";
    var descripcion ="";
    var area = "";

    final operacionController = TextEditingController();
    final clienteController = TextEditingController();
    final descripcionController = TextEditingController();
    final areaController =  TextEditingController();

    @override
    void dispose(){
      operacionController.dispose();
      clienteController.dispose();
      descripcionController.dispose();
      areaController.dispose();
    }
    clearText(){
      operacionController.clear();
      clienteController.clear();
      descripcionController.clear();
      areaController.clear();
    }

    CollectionReference proyecto = FirebaseFirestore.instance.collection('Proyecto');

    Future<void> addProyecto(){
    return proyecto
    .add({'codOperacion':operacion,'cliente':cliente,'descripcion':descripcion,'area':area})
    .then((value) => print('Proyecto agregado'))
    .catchError((error)=>print('No se agrego el proyecto:$error'));
  }

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
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Registro de Especificacion',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Registre informacion tecnica en todos los campos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(142,147, 142,1.2),
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Cod. Operacion',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0
                    )
                  ),
                  controller: operacionController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Seleccione Operacion';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(142,147, 142,1.2),
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Cliente',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0
                    )
                  ),
                  controller: clienteController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Seleccione Cliente';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(142,147, 142,1.2),
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Descripcion',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0
                    )
                  ),
                  controller: descripcionController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Seleccione Descripcion';
                    }
                    return null;
                  },
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(142,147, 142,1.2),
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Escoga el  area',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0
                    )
                  ),
                  controller: areaController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Seleccione el area';
                    }
                    return null;
                  },
                ),
              ),
              
              Container(
                      width: 350,
                      height: 45,
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              operacion = operacionController.text;
                              cliente = clienteController.text;
                              descripcion = descripcionController.text;
                              area= areaController.text;
                              addProyecto();
                              clearText();
                            });
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color:Theme.of(context).buttonColor,
                        child: Text('Registrar',style: TextStyle(
                          color:Colors.white,
                          fontSize:17.0
                        ),),
                      ),
                    ),

                    Container(
                      width: 350,
                      height: 45,
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        onPressed: (){
                          clearText();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color:Theme.of(context).disabledColor,
                        child: Text('Limpiar',style: TextStyle(
                          color:Colors.white,
                          fontSize:17.0
                        ),),
                      ),
                    ),

            ],
            
          ),
        ),
      ),
    );
  }
}



Widget _UpdatePdf(BuildContext context){
  return Container(
    
  );
}