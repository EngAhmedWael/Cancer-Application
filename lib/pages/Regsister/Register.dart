
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cancer/Statemanagment/CubitSignup.dart';
import 'package:cancer/Statemanagment/StateSignup.dart';
import 'package:cancer/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/UserModel.dart';
import '../../Widget/assetsimage.dart';
import '../../Widget/textformfield.dart';
import '../../Widget/typebutton.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int _number = 0;
  TextEditingController email = TextEditingController();
  TextEditingController UserName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController Age = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool Obsure = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
        body: BlocConsumer<SigUpCubit, SigupState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assetimage(
                    image: AssetImage('assets/images/Sigin.jpg'),
                    heigh: 200,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Textform(

                      obsure: false,
                      icon: Icons.email,
                      text: 'Email',
                      onchanged: (value) {
                        email.text = value;
                      }),
                  Textform(
                      obsure: Obsure,
                      icon: Icons.lock,
                      onchanged: (value) {
                        password.text = value;
                      },
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
                  Textform(
                      obsure: false,
                      icon: Icons.person,
                      text: 'Name',
                      onchanged: (value) {
                        UserName.text = value;
                      }),
                  Textform(
                    obsure: false,
                    icon: Icons.phone,
                    text: 'Phone',
                    keyboard: TextInputType.phone,
                    counter: '$_number /11 ',
                    onchanged: (value) {
                      phone.text = value;
                      setState(() {
                        _number = value.length;
                      });
                    },
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly, // للسماح بالأرقام فقط
                      LengthLimitingTextInputFormatter(
                          11), // لتحديد الحد الأقصى لعدد الأرقام
                    ],
                  ),
                  Textform(
                    obsure: false,
                    icon: Icons.date_range_outlined,
                    text: 'Age',
                    controller: Age,
                    obtap: () async {
                      DateTime? selectedDate = DateTime(1900); // Initial date
                      FocusScope.of(context)
                          .requestFocus(FocusNode()); // Hide keyboard
                      selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100), // Adjust as needed
                      );
                      if (selectedDate != null) {
                        String formattedDate =
                            "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                        Age.text = formattedDate;
                      }
                    },
                    keyboard: TextInputType.datetime,
                  ),
                  Textbutton(
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<SigUpCubit>(context).Regsister(
                            email: email.text, password: password.text);
                      }
                    },
                    text: 'Register',
                    width: width,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Text("I already have an account"),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Textbutton(
                      width: width,
                      onpressed: () {
                        Navigator.pushReplacementNamed(context, 'SigIn');
                      },
                      text: 'Login'),
                  SizedBox(height: 8)
                ]),
          ),
        );
      },


      listener: (context, state) {
        if (state is LoadingState) {}
        if (state is SuccessState) {
          UserModel userModel = UserModel(
              uId: FirebaseAuth.instance.currentUser!.uid,
              username: UserName.text,
              email: email.text,
              phone: phone.text,
              userDeviceToken: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
              CancerType: '',
              Age: Age.text, Image:null );
          FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(userModel.toMap());
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'A new account has been created. Please go to the email and activate the account')));
          Navigator.pushReplacementNamed(context, 'SigIn');
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
