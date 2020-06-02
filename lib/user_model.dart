import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserModel{

  static List<UserModel> UsersList = [];

  String nome,
         email,
         phone;

  UserModel(this.nome, this.email, this.phone) {
    UsersList.add(this);
  }

  static UserModel fromMap(map) {
    return UserModel(map['nome'],map['email'],map['phone']);
  }

  Map<String, String> toMap() {
    return {
      'nome': nome,
      'email': email,
      'phone': phone,
    };
  }


  static Future<File> _getDocumentsFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/contactsData.json');
  }

  static Future<File> saveData() async {
    final file = await _getDocumentsFile();
    return file.writeAsString(json.encode(UsersList.map((item) => item.toMap()).toList()));
  }

  static Future<String> readData() async {
    try {
      final file = await _getDocumentsFile();
      return file.readAsString();
    } catch (error) {
      print(error);
      return null;
    }
  }

}