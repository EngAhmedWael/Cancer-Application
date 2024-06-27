
import 'dart:io';

import 'package:cancer/Widget/assetsimage.dart';
import 'package:cancer/pages/Home/Widget/Update%20Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constance.dart';
import '../../../constant.dart';
import '../../../core/Widget/RowCustombutton.dart';
import '../../../core/styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? Phone;

  String? date;
  String? UserName;
var imageUrl;

  void Information()  {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        UserName = documentSnapshot['username'] as String;
        imageUrl = documentSnapshot['Image'] as String;
        Phone = documentSnapshot['phone'] as String;
        date = documentSnapshot['Age'] as String;
      });
    });

  }
  @override
  void initState() {
    Information();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [

             imageUrl==null?   CircleAvatar(
                radius: 70,
                backgroundImage:AssetImage('assets/images/person.jpg'),


              ): CircleAvatar(
               radius: 70,
               backgroundImage:NetworkImage(     imageUrl!,
               )
           ,

              
             ),
              const SizedBox(height: 15),

              itemProfile('الاسم', '${UserName==null?'':UserName}', CupertinoIcons.person),


              const SizedBox(height: 10),

              itemProfile('رقم تلفون', '${Phone==null?'':Phone}', CupertinoIcons.phone),
              const SizedBox(height: 10),

              itemProfile('تاريخ الميلاد','${date==null?'':date}', CupertinoIcons.arrow_up_doc_fill),
              const SizedBox(height: 10),

              itemProfile('Email', '${FirebaseAuth.instance.currentUser!.email==null?'':FirebaseAuth.instance.currentUser!.email}', CupertinoIcons.mail),
              const SizedBox(height: 30,),
              RowCustomButton(
                title1: 'Log out',
                onpressed1: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, 'SigIn');
                },
                title2:'update data' ,
                onpressed2: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => UpdateProfile(docid: FirebaseAuth.instance.currentUser!.uid),));
                },
              ),

            ],
          ),
        ),

      ),
    );
  }

}


itemProfile(String title, String subtitle, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              color: Colors.deepOrange.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 10
          )
        ]
    ),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(iconData),
      trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
      tileColor: Colors.white,
    ),
  );
}


