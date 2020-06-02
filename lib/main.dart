import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(ListaContatos());

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Contatos',
      theme: ThemeData(
        hintColor: Colors.grey,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none)
        ),
        textTheme: Typography.whiteCupertino,
        primaryColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}