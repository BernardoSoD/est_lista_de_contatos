import 'package:estlistadecontatos/home_screen.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';

class ContactScreen extends StatefulWidget {
  UserModel user;

  ContactScreen();

  ContactScreen.fromCard(this.user);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.user != null){
      _nomeController.text = widget.user.nome;
      _emailController.text = widget.user.email;
      _phoneController.text = widget.user.phone;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contatos',
          style: TextStyle(fontSize: 25)
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen())
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Icon(Icons.account_circle, color: Colors.blueGrey, size: 200,),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _nomeController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Nome',),
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'Campo Obrigatório!';
                      else return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        isEditing = true;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (text) {
                      if (text == null || text.isEmpty)
                        return 'Campo Obrigatório!';
                      else if (!text.contains('@'))
                        return 'E-mail inválido!';
                      else return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        isEditing = true;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Telefone'),
                    onChanged: (text) {
                      setState(() {
                        isEditing = true;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'SALVAR',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    onPressed: isEditing ? () {
                      if (_formKey.currentState.validate()){
                        UserModel.saveOrEdit(
                          widget.user,
                          _nomeController.text,
                          _emailController.text,
                          _phoneController.text);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomeScreen())
                        );
                      }
                    } : null
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}