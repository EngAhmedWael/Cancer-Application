import 'package:cancer/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widget/assetsimage.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;
  User? user = FirebaseAuth.instance.currentUser;
  Future<void> loggdin(BuildContext context) async {
    if (user != null) {
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
      Navigator.pushReplacementNamed(context, 'SigIn');
    }
  }

  @override
  void initState() {
    initSlidingAnimation();
    NavigateTo();
    Future.delayed(const Duration(seconds: 3), () {
      loggdin(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void NavigateTo() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'SelectAccount');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Assetimage(
          image: AssetImage(
            'assets/images/Sigin.jpg',
          ),
          heigh: 400,
        ),
        AnimatedBuilder(
          animation: SlidingAnimation,
          builder: (context, _) {
            return SlideTransition(
              position: SlidingAnimation,
              child:  Text(
                'Skin Cancer Detection \n \t\t \t\tI can and I will ',
                style: TextStyle(
                    fontSize: 25, color: Kpimary, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ]),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    SlidingAnimation.addListener(() {
      setState(() {});
    });
  }
}
