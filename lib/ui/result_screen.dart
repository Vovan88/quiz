import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResultPage extends StatefulWidget {
  final int answerCountCorrect;
  final int answerNotCountCorrect;

  final String difficult;

  final String category;

  const ResultPage({
    Key? key,
    required this.answerCountCorrect,
    required this.answerNotCountCorrect,
    required this.difficult,
    required this.category,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
            child: Text(
                "You result: ${widget.answerCountCorrect} aswers are right")),
        Positioned(
            bottom: 10,
            right: 20,
            child: TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                saveToFb();
              },
              child: const Text("Save result"),
            ))
      ]),
    );
  }

  saveToFb() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore db = FirebaseFirestore.instance;

    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();

    db.collection('results').doc(userCredential.user!.uid).set({
      'answerCountCorrect': widget.answerCountCorrect,
      'answerCountNotCorrect': widget.answerNotCountCorrect,
      'difficult': widget.difficult,
      'category': widget.category,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });
  }
}
