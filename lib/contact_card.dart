import 'package:estlistadecontatos/contact_screen.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';

class ContactCard extends StatelessWidget {

  UserModel user;

  ContactCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16,8,16,8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromRGBO(33, 150, 243, 0.66), Colors.blue]
                )
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8, left: 8),
                child: Icon(Icons.account_circle, size: 70,)
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text(user.nome),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.email, size: 20)
                        ),
                        Text(user.email)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.phone, size: 20,)
                        ),
                        Text(user.phone)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8,top: 8),
                child: GestureDetector(
                  child: Icon(Icons.create, size: 30),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ContactScreen.fromCard(user))
                    );
                  },
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}
