import 'package:flutter/material.dart';
import 'user_model.dart';
import 'contact_card.dart';
import 'contact_screen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contatos',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
        future: UserModel.readData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator(),);
          else {
            if (!snapshot.hasError) {
              UserModel.UsersList = List<Map>.from(json.decode(snapshot.data)).map((i) => UserModel.fromMap(i)).toList();
              return ListView.builder(
                itemCount: UserModel.UsersList.length,
                itemBuilder: (context, index) {
                  List _reversedList = UserModel.UsersList.reversed.toList();
                  return ContactCard(_reversedList[index]);
                }
              );
            }
            else
              return Center(child: Text('Erro ao carregar dados'),);
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ContactScreen())
          );
        }
      ),
    );
  }
}