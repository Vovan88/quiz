import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int answerCountCorrect;

  const ResultPage({
    Key? key,
    required this.answerCountCorrect,
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
              onPressed: () {},
              child: const Text("Save result"),
            ))
      ]),
    );
  }
}
