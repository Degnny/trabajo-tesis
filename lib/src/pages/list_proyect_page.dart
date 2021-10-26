

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesisv1/src/pages/update_proyect.dart';
import 'package:flutter_tesisv1/widget/navBar.dart';

class ListProyectPage extends StatefulWidget {
  const ListProyectPage({ Key? key }) : super(key: key);

  @override
  _ListProyectPageState createState() => _ListProyectPageState();
}

class _ListProyectPageState extends State<ListProyectPage> {

  final Stream<QuerySnapshot> proyectStream = FirebaseFirestore.instance.collection('Proyecto').snapshots();


  CollectionReference proyecto = FirebaseFirestore.instance.collection('Proyecto');

  Future<void> deleteProyecto(id){
   // print("User Delete $id");
   return proyecto
   .doc(id)
   .delete()
   .then((value) => print('Proyecto Delete'))
   .catchError((error)=>print('Faile to Delete user:$error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: proyectStream,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if (snapshot.hasError) {
          print ('Something went wrong');
        }
      if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),
          );
        }

        final List storedocs = [];
        snapshot.data!.docs.map((DocumentSnapshot document){
          Map a = document.data()as Map<String, dynamic>;
          storedocs.add(a);
          a['id'] = document.id;
          
        }).toList();

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
    
    body: ListView(
      padding:const EdgeInsets.all(8),
      children:<Widget> [
        for (var i = 0; i < storedocs.length; i++)...[
        Card(
          child: ListTile(
            title: Text('Cod. Operacion: '+storedocs[i]['codOperacion']),
            subtitle: Text('Cliente: '+storedocs[i]['cliente']),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/molinos.jpg'),
            ),
            trailing: IconButton(onPressed:()=>{
              Navigator.push(context, MaterialPageRoute(builder:(context)=> 
              UpdateProyectPage(id:storedocs[i]['id'])))
            },
            icon: Icon(
              Icons.edit,
              color: Colors.orange
            ),
            ), 
          ),
        ),

        
        
      ]
      ]
    )
    );
    }
    );
  }
}