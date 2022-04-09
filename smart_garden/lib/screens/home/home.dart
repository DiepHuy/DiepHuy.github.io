import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:smart_garden/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // late final dref = FirebaseDatabase.instance.ref();
  // late DatabaseReference databaseReference;
  // setData() {
  //   dref.child("Value").set({'Temp': '37', 'Humi': '30'});
  // }

  // showData() {
  //   dref.once().then((snapshot) {
  //     print(snapshot.snapshot.value);
  //   });
  // }

  // void initState(){
  //   databaseReference =dref;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Smart Garden'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            style: TextButton.styleFrom(primary: Colors.white70),
            label: Text('Log out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children:  <Widget>[
          Text(
            '\n\tTemperature:',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '\nHumidity:',
            style: TextStyle(fontSize: 20),
          ),
        
        // FirebaseAnimatedList(query: databaseReference, itemBuilder: (BuildContext context,DataSnapshot snapshot, Animation animation, int index){
        //   return Text(snapshot.value.toString());
        // })
        
        ],
      ),
    );
  }
}
