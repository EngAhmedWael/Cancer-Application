

import 'dart:io';

import 'package:cancer/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Widget/textformfield.dart';
import '../../../constance.dart';
import '../../../core/styles.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key,required this.docid});
  final String docid;
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

@override
int _number = 0;
  void initState() {
  FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    setState(() {
      imageUrl = documentSnapshot['Image'] as String;
      namenew = documentSnapshot['username'] as String;

      phonenew = documentSnapshot['phone'] as String;
    });
  });

    super.initState();
  }

  CollectionReference category=FirebaseFirestore.instance.collection('Users');

  GlobalKey<FormState> formKey = GlobalKey();
  final ImagePicker _imagePicker = ImagePicker();
  var imageUrl;
TextEditingController namenewcontroller=TextEditingController();

TextEditingController phonenewcontroller=TextEditingController();
var namenew;
var phonenew;
  Future<void> pickImage() async {
    try {
      XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (res != null) {
        await uploadFile(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("Failed to pick image: $e"),
        ),
      );
    }
  }
  uploadFile(File selectedFile) async {
    EasyLoading.show(status: "please wait...");
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('files')
        .child(selectedFile.path.split('/').last);
    try {
      var uploadTask = await ref.putFile(selectedFile);
      var downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;

       });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Success"),
              content: Text('Your profile picture has been created successfully'),
            );
          });
      setState(() {
        EasyLoading.dismiss();
      });
    } on FirebaseException catch (e) {
      setState(() {
        EasyLoading.dismiss();
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("uploadTask Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }
  editcategry()async{
    if(formKey.currentState!.validate()){
      try {
        EasyLoading.show(status: "please wait...");
        setState(() {

        });
        await category.doc(widget.docid).update({
          'username':namenew,
          'phone':phonenew,

        'Image':imageUrl


        });
      EasyLoading.dismiss();
        setState(() {

        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The data has been modified successfully')));


      }catch (e) {
        EasyLoading.dismiss();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Try again later')));

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: AppConstants.height20(context),),
                    Text('تعديل البيانات ',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w600),)
                    , SizedBox(height: AppConstants.height30(context),),

                    imageUrl==null? CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/person.jpg'),
                      child: Align(alignment: Alignment.bottomRight,child: IconButton(onPressed:pickImage,icon:Icon(Icons.camera_alt))),
                    ): CircleAvatar(
                      radius: 70,
                      backgroundImage:NetworkImage(imageUrl!),
                      child: Align(alignment: Alignment.bottomRight,child: IconButton(onPressed:pickImage,icon:Icon(Icons.camera_alt))),
                    ),

                    SizedBox(height: AppConstants.height30(context),),

                    Textform(
                      onchanged: (value){
                        namenew=value;
                      },
                      controller:namenewcontroller ,
                      text:'User Name' , obsure: false,
                      icondata: IconButton(onPressed: (){},icon:Icon(Icons.person,color: Kprimary)),
                    ),


                    SizedBox(height: AppConstants.height15(context),),

                    Textform(
                      controller:phonenewcontroller ,
                        keyboard: TextInputType.phone,
                        counter: '$_number /11 ',
                      onchanged: (value){
                        phonenew=value;
                        setState(() {
                          _number = value.length;
                        });
                      },
                      text:'Phone Number' , obsure: false,
                      icondata: IconButton(onPressed: (){},
                          icon:Icon(Icons.phone,color: Kprimary))

                    ),
                    SizedBox(height: AppConstants.height30(context),),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width:MediaQuery.of(context).size.width*0.4,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Kprimary,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: MaterialButton(

                                onPressed: () {
                                  Navigator.pushNamed(context,'Home');
                                },


                                child:  Text('go back',style:Styles.text60012White(context).copyWith(color: Colors.white,fontSize: 18),)
                            ),
                          ),
                        ), SizedBox(width: AppConstants.width15(context),),
                        Expanded(
                          child: Container(
                            width:MediaQuery.of(context).size.width*0.4,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Kprimary,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: MaterialButton(

                                onPressed: ()  async{
                                  editcategry();
 await Future.delayed(Duration(seconds: 8),(){

  });
                                  Navigator.pushNamed(context,'Home');
                                  },


                                child:  Text('Saving data',style:Styles.text60012White(context).copyWith(color: Colors.white,fontSize: 18),)
                            ),
                          ),
                        ),


                      ],
                    ),

                  ],

                ),
              ),
            ),

          ),
        ));
  }
}



