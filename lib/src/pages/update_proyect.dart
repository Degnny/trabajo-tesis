import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateProyectPage extends StatefulWidget {
final String id;

  const UpdateProyectPage({Key? key,required this.id}) : super(key: key);

  @override
  _UpdateProyectPageState createState() => _UpdateProyectPageState();
}

class _UpdateProyectPageState extends State<UpdateProyectPage> {

  final _formKey = GlobalKey<FormState>();

  CollectionReference proyecto = FirebaseFirestore.instance.collection('Proeycto');

  Future<void> updateProduct(id,operacion,cliente,descripcion,area){
    return proyecto
    .doc(id)
    .update({'codOperacion':operacion,'cliente':cliente,'descripcion':descripcion,'area':area})
    .then((value) => print('Product Update'))
   .catchError((error)=>print('Failed to update product:$error'));
  }


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
        key: _formKey,
        child:FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(future: FirebaseFirestore.instance.collection('Proyecto')
        .doc(widget.id)
        .get(),
        builder: (_,snapshot){
          if(snapshot.hasError){
            print('Something went wrong');
          }
          if(snapshot.connectionState == ConnectionState.waiting)
          {
            return Center(child:CircularProgressIndicator(),);
          }
          var data = snapshot.data!.data();
          var operacion = data!['codOperacion'];
          var cliente = data['cliente'];
          var descripcion= data['descripcion'];
          var area = data['area'];
          
          return Padding(
            padding: EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      'Modificar Proyecto',
                      style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Actualice la informacion tecnica del campos',
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
                        initialValue: operacion ,
                        autofocus: false,
                        onChanged: (value)=>operacion=value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Cod. Operacion',
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please Enter Operacion';
                          }
                          return null;
                        }
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
                        initialValue: cliente,
                        autofocus: false,
                        onChanged: (value)=>cliente=value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Cliente',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          errorStyle: TextStyle(
                            color:Colors.redAccent,
                            fontSize: 15.0
                          )
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                          return 'Please Enter Cliente';
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
                        initialValue: descripcion,
                        autofocus: false,
                        onChanged: (value)=>descripcion=value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Descripcion',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          errorStyle:TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15  
                          )
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please Enter Descripcion';
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
                        initialValue: area,
                        autofocus: false,
                        onChanged: (value)=>area=value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Area Destino',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15
                          )
                        ),
                      ),
                    ),

                    Container(
                      width: 350,
                      height: 45,
                      margin: EdgeInsets.only(top: 30),
                      child: RaisedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                                updateProduct(widget.id, operacion, cliente, descripcion,area);
                                Navigator.pop(context);
                          }
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        color:Theme.of(context).buttonColor,
                        child: Text('Actualizar',style: TextStyle(
                          color:Colors.white,
                          fontSize:17.0
                        ),),
                      ),
                    ),

                    
                  ],
                ),
              )
            );
          }
        )
      )  ,
    );
  }
}






Widget _areaDestino (BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.only(left: 20.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(142,147, 142,1.2),
      borderRadius: BorderRadius.circular(40.0)
    ),
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Area Destino',
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        )
      ),
    ),
  );
}