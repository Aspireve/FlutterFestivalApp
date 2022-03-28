import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOMEPAGE"),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text("THIS IS THE HOMEPAGE"),
      ),
    );
  }
}
