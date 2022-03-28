import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String email = " ";
  String password = " ";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN PAGE",style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text("E-Mail",style: TextStyle(fontSize: 25),)),
              onChanged: (value){
                setState(() {
                  email = value;
                });
              },
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              decoration: InputDecoration(label: Text("Password",style: TextStyle(fontSize: 25),)),
              onChanged: (value){
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
            ),
            ElevatedButton(onPressed: () async {
              try{
                final signedUser = await auth.signInWithEmailAndPassword(email: email, password: password);
                if(signedUser != null){
                  Navigator.pushNamed(context, '/homepage');
                }
              }
              catch(e){
                print(e);
              }
            }, child: Text("LOG-IN"))
          ],
        ),
      ),
    );
  }
}
