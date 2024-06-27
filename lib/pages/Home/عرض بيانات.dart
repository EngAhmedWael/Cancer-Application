
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../constance.dart';
import '../../constant.dart';
// Admin
class Info extends StatefulWidget {
  const Info({super.key,required this.Categoryid});
final String Categoryid;
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<DocumentSnapshot>data=[];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Kpimary,
        centerTitle: true,
        title: Text('عرض بيانات',style: TextStyle(color: Colors.white),
      ),),
      body:StreamBuilder(stream:FirebaseFirestore.instance.collection('Users').doc( '${widget.Categoryid}').snapshots(),builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 30),
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ],
                  borderRadius:
                  BorderRadius.all(Radius.circular(AppConstants.sp20(context)))),
              child: Column(
                children: [
                  buildinfo(context,title: 'UserName:',Subtitle:snapshot.data!['username']),
                  SizedBox(height: AppConstants.height5(context),),
                  buildinfo(context,title: 'Email:',Subtitle:snapshot.data!['email']),
                  buildinfo(context,title: 'Phone:',Subtitle:snapshot.data!["phone"]),
                  buildinfo(context,title: 'Age:',Subtitle:snapshot.data!['Age']),
                ],
              ),
            )
          ],
        );
      },)
    );
  }

  Row buildinfo(BuildContext context, {required String title,required String Subtitle}) {
    return Row(
      children: [
        Text(title,style: TextStyle(fontSize: 20),),
        SizedBox(width:MediaQuery.of(context).size.width*0.02,),
        Expanded(child: Text( Subtitle,maxLines: 1,style: TextStyle(fontSize: 18,),overflow: TextOverflow.ellipsis,)),
      ],
    );
  }
}

