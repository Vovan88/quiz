import 'package:flutter/material.dart';
import 'package:quiz/models/models.dart';

class QuationCardWidget extends StatelessWidget {
  final Question quationCardWidgetCard;
  final Function(String) tapAnswer;

  const QuationCardWidget(
      {Key? key, required this.quationCardWidgetCard, required this.tapAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                quationCardWidgetCard.question,
                style: const TextStyle(fontSize: 20),
              )),
              Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      quationCardWidgetCard.answers.answerA.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_a_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerA)),
                            ),
                      quationCardWidgetCard.answers.answerB.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_b_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerB)),
                            ),
                      quationCardWidgetCard.answers.answerC.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_c_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerC)),
                            ),
                      quationCardWidgetCard.answers.answerD.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_d_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerD)),
                            ),
                      quationCardWidgetCard.answers.answerE.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_e_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerE)),
                            ),
                      quationCardWidgetCard.answers.answerF.toString().isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextButton(
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green)),
                                  onPressed: () {
                                    tapAnswer("answer_f_correct");
                                  },
                                  child: Text(
                                      quationCardWidgetCard.answers.answerF)),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
