import 'package:cancer/core/styles.dart';
import 'package:cancer/pages/Home/TFliteModel.dart';
import 'package:cancer/pages/Home/Widget/Chatbot.dart';
import 'package:cancer/pages/Home/Widget/Information.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import 'Widget/Profile.dart';

class Home extends StatefulWidget {
   Home({super.key,required this.currentindex});
 int currentindex = 0;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Widget>  SelectScreen=[
   const Profile(),
    const TfliteModel(),const Chatbot(),const Information()];
  List<String> title=["Personal data","Skin","Chatbot","Information about App"];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar:AppBar(
  automaticallyImplyLeading: false,
  title:Text( title[widget.currentindex],style: Styles.textLogo70025Black(context).copyWith(color: Colors.white), ),backgroundColor: Kprimary,),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor:Colors.transparent,
            animationDuration:const Duration(milliseconds: 300),
            onTap: (value) {
              setState(() {
                widget.currentindex=value;
              });
            },
        color: Kprimary,
            items: const <Widget>[
              Icon(Icons.person,size: 26,color: Colors.white,),
              Icon(Icons.home,size: 26,color: Colors.white,),
              Icon(Icons.chat,size: 26,color: Colors.white,),
              Icon(Icons.info,size: 26,color: Colors.white,)
            ]),
        body:SelectScreen[widget.currentindex]
    );
  }
}



