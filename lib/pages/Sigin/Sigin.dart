
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cancer/Statemanagment/CubitSigin.dart';
import 'package:cancer/Statemanagment/StateSigin.dart';
import 'package:cancer/constance.dart';
import 'package:cancer/constant.dart';
import 'package:cancer/pages/ForgetPassword/ForgetPassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Widget/assetsimage.dart';
import '../../Widget/textformfield.dart';
import '../../Widget/typebutton.dart';

class Sigin extends StatefulWidget {
  Sigin({super.key});

  @override
  State<Sigin> createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool Obsure = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        body: BlocConsumer<SigInCubit, SiginState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assetimage(
                  image: AssetImage('assets/images/Sigin.jpg'),
                  heigh: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Textform(
                  obsure: false,
                  icon: Icons.email,
                  text: 'Email',
                  onchanged: (value) {
                    email.text = value;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Textform(
                    obsure: Obsure,
                    onchanged: (value) {
                      password.text = value;
                    },
                    icon: Icons.lock,
                    text: 'password',
                    icondata: IconButton(
                        onPressed: () {
                          setState(() {
                            Obsure = !Obsure;
                          });
                        },
                        icon: Obsure
                            ? Icon(
                                Icons.visibility_off,
                                color: Kpimary,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Kpimary,
                              ))),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forget(),
                        ));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textbutton(
                    width: width,
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SigInCubit>(context)
                            .Login(email: email.text, password: password.text);
                      }
                    },
                    text: 'Login'),
                SizedBox(
                  height: AppConstants.height30(context),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Text("Don't have an account?"),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppConstants.height30(context),
                ),
                Textbutton(
                    width: width,
                    onpressed: () {
                      Navigator.pushReplacementNamed(context, 'SigUp');
                    },
                    text: 'Register'),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SuccessState) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .get()
                .then((DocumentSnapshot documentSnapshot) {
              if (documentSnapshot['isAdmin'] == true) {
                Navigator.pushReplacementNamed(context, 'Admin');
              } else {
                Navigator.pushReplacementNamed(context, 'Home');
              }
            });
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'verification',
              desc:
                  "Please go to your email and click on the email verification link to activate your account",
            ).show();
          }
        } else if (state is FailureState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: '${state.errorMessage}',
          ).show();
        }
      },
    ));
  }
}
