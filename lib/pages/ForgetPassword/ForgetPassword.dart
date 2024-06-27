
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widget/assetsimage.dart';
import '../../Widget/textformfield.dart';
import '../../Widget/typebutton.dart';

class Forget extends StatelessWidget {
  Forget({super.key});
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
      
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff7fadf2),
        centerTitle: true,
        title: Text(
          'Forget Password',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assetimage(
              image: AssetImage('assets/images/Sigin.jpg'),
              heigh: 300,
            ),
            SizedBox(
              height: 30,
            ),
            Textform(
                obsure: false,
                icon: Icons.email,
                text: 'Email',
                onchanged: (value) {
                  email.text = value;
                }),
            SizedBox(
              height: 30,
            ),
            Textbutton(
                onpressed: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'A message has been sent to you via email to enter a new password')));
                },
                text: 'Forget',
                width: width)
          ],
        ),
      ),
    );
  }
}
