import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/models/models.dart';
import 'package:quiz/ui/result_screen.dart';

import '../bloc/bloc.dart';
import 'widgets/quation.dart';

class QuationsPage extends StatefulWidget {
  final String category;
  final String difficult;

  const QuationsPage({
    Key? key,
    required this.category,
    required this.difficult,
  }) : super(key: key);

  @override
  State<QuationsPage> createState() => _QuationsPage();
}

class _QuationsPage extends State<QuationsPage> {
  int answerCountCorrect = 0;
  int answerCountNotCorrect = 0;

  CarouselController buttonCarouselController = CarouselController();
  @override
  void initState() {
    getQuestion(widget.difficult, widget.category);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: StreamBuilder<List<Question>>(
            stream: streamQuestion,
            builder: (context, AsyncSnapshot<List<Question>> quations) {
              if (quations.hasData) {
                return Center(
                  child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        onPageChanged: null,
                        onScrolled: ((value) {
                          if (value?.toInt() == quations.data!.length - 1) {
                            Navigator.pushAndRemoveUntil(context,
                                CupertinoPageRoute(builder: (context) {
                              return ResultPage(
                                category: widget.category,
                                difficult: widget.difficult,
                                answerCountCorrect: answerCountCorrect,
                                answerNotCountCorrect: answerCountNotCorrect,
                              );
                            }), (c) => false);
                          }
                        }),
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        disableCenter: false,
                        enlargeCenterPage: true,
                        height: MediaQuery.of(context).size.height),
                    items: quations.data!
                        .map((item) => QuationCardWidget(
                              quationCardWidgetCard: item,
                              tapAnswer: (ans) {
                                Map<String, dynamic> answersCorrect =
                                    item.correctAnswers.toJson();

                                if (answersCorrect[ans] == "true") {
                                  answerCountCorrect++;
                                } else {
                                  answerCountNotCorrect++;
                                }

                                buttonCarouselController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear);
                              },
                            ))
                        .toList(),
                  ),
                );
              }

              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
