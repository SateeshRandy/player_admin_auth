//1.handleAuthState()
//2.signing with google()
//3.signOut()

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService{
  final FirebaseFirestore auth = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> paymentCred =FirebaseFirestore
      .instance.collection("paymentCred").snapshots();
  handleAuthState(){

    return StreamBuilder<QuerySnapshot>(stream: paymentCred,
      builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot,
          ) {
        if(snapshot.hasError){
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        final data = snapshot.requireData;

        return ListView.builder(
            itemCount: data.size,
            itemBuilder:(context,index){
              return AuthService().signInWithGoogle();
            }
        );
      },);
  }
  signInWithGoogle() async{
    // trigger the auth flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // create a new credintial
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseFirestore.instance.collection("paymentCred").doc('adminGames').snapshots();
  }
      signOut() {
    FirebaseAuth.instance.signOut();
      }

}