import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  String email = " ";
  String password = " ";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SINGUP PAGE",style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.purple,
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
            ElevatedButton(onPressed: () {
              try{
                final newUser = auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newUser != null){
                  Navigator.pushNamed(context, '/homepage');
                }
              }
              catch(e){
                print(e);
              }

            }, child: Text("SignUp")),
          ],
        ),
      ),
    );
  }
}
