import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class UserModel{

  static List<UserModel> UsersList = [];

  String nome,
         email,
         phone;

  UserModel(this.nome, this.email, this.phone);

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

  static void saveOrEdit(UserModel userModel, String nome, String email, String phone) {
    if (userModel != null){
      int index = UserModel.UsersList.indexOf(userModel);
      UserModel.UsersList.removeAt(index);
      UserModel.UsersList.insert(
        index,
        UserModel(
          nome,
          email,
          phone));
    }
    else  {
      UserModel.UsersList.add(
        UserModel(
          nome,
          email,
          phone));
    }
    UserModel._saveData();
  }


  static Future<File> _getDocumentsFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/contactsData.json');
  }

  static Future<File> _saveData() async {
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