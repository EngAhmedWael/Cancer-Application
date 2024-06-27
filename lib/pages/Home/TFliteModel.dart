
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cancer/constance.dart';
import 'package:cancer/pages/Home/About.dart';
import 'package:cancer/pages/Home/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant.dart';
import '../../core/Widget/RowCustombutton.dart';

class TfliteModel extends StatefulWidget {
  const TfliteModel({Key? key}) : super(key: key);

  @override
  _TfliteModelState createState() => _TfliteModelState();
}

class _TfliteModelState extends State<TfliteModel> {
  late File _image;


  late List _results;
  bool imageSelect = false;
  String? Phone;
  String? date;
  String? UserName;


  @override
  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt"))!;
    print("Models loading status: $res");
  }

  Future imageClassification(File image) async {
    final List? recognitions = await Tflite.runModelOnImage(
      path: image.path,
      asynch: true,
      numResults: 3,
      threshold: 0,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
/*
 appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: Kpimary,
        title: Text('SkinApp',
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
 */

      imageSelect
          ? Column(
        children: [
          Container(


            height: 224,
            margin: const EdgeInsets.all(10),
            child: Image.file(_image),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: (imageSelect)
                      ? _results.map((result) {
                    return Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.4,
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "${result['label']} - ${result['confidence']
                              .toStringAsFixed(2)}",textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Kpimary, fontSize: 20),
                        ),
                      ),
                    );
                  }).toList()
                      : [],
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RowCustomButton(title1: 'About', title2: 'Cancel', onpressed1: (){
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                        builder: (context) => Home(currentindex: 3,)));
                       }
                  , onpressed2: (){Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => Home(currentindex: 1,)));}),
                ),

              ],
            ),
          )
        ],
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppConstants.height500(context),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/homescreenimg.jpg"),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: AppConstants.height30(context),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RowCustomButton(
                title1: 'Upload Image',
                title2: 'Open Camera',
                onpressed1: UploadImage,
                onpressed2: pickImage,
              ),
            ),

          ],
        ),
      );

  }
  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    var  image1 = await _picker.pickImage(source: ImageSource.camera);
    File image = File(image1!.path);
    imageClassification(image);
  }
  Future UploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }



}
/* floatingActionButton: FloatingActionButton(
        onPressed: pickImage,
        tooltip: "Pick Image",
        child: const Icon(Icons.image),
      ),
    );*/
/*
Drawer(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: ListView(children: [
            Container(
              width: double.infinity,
              height: 250,
              child: const DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Image(
                    image: AssetImage('assets/images/Sigin.jpg'),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.fill,
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const Text(' Email   ', style: TextStyle(fontSize: 20)),

                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    '${FirebaseAuth.instance.currentUser!.email}', maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(' UserName:   ', style: TextStyle(fontSize: 20),),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    '${UserName}',
                      maxLines: 1,overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                  ),
                ),


              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(' User phone:  ', style: TextStyle(fontSize: 20)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${Phone}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
                ),


              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(' Date of birth  ',
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '${date}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: BoxDecoration(
                    color: Kpimary, borderRadius: BorderRadius.circular(18)),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => About(),
                        ));
                  },
                  child: Text(
                    'Information about App',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: BoxDecoration(
                    color: Kpimary, borderRadius: BorderRadius.circular(18)),
                child: MaterialButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.rightSlide,
                      title: ' Delete Account',
                      btnOkColor: Colors.green,
                      btnOkOnPress: () {
                        FirebaseAuth.instance.currentUser!.delete();
                        FirebaseFirestore.instance
                            .collection('Users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .delete();
                        Navigator.pushReplacementNamed(context, 'SigIn');
                      },
                      btnOkText: 'Yes',
                      btnCancelText: 'No',
                      btnCancelColor: Colors.red,
                      btnCancelOnPress: () {},
                      desc: 'Are you sure you want to delete an account?',
                    ).show();
                  },
                  child: Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: BoxDecoration(
                    color: Kpimary, borderRadius: BorderRadius.circular(18)),
                child: MaterialButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.rightSlide,
                      title: 'Log out',
                      btnOkColor: Colors.green,
                      btnOkOnPress: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacementNamed(context, 'SigIn');
                      },
                      btnOkText: 'Yes',
                      btnCancelText: 'No',
                      btnCancelColor: Colors.red,
                      btnCancelOnPress: () {},
                      desc: 'Are you sure you want to log out?',
                    ).show();
                  },
                  child: Text(
                    'Log out ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      )

 */